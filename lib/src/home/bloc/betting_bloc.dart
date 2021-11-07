import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sporting_winnings/src/home/data/api_requests/api_requests.dart';
import 'package:sporting_winnings/src/home/data/models/game.dart';
import 'package:sporting_winnings/src/home/data/models/odd_option.dart';
import 'package:sporting_winnings/src/home/data/models/query.dart';
import 'package:sporting_winnings/src/home/data/models/sport_category.dart';

part 'betting_event.dart';
part 'betting_state.dart';

class BettingBloc extends Bloc<BettingEvent, BettingState> {
  final ApiRequests _apiRequests;
  final List<Game> _games = [];
  final List<String> _loadedGameIds = [];

  BettingBloc(this._apiRequests) : super(const BettingState()) {
    on<LoadRequested>((event, emit) async {
      if (state.category != null) {
        emit(state.copyWith(status: LoadingStatus.loading));

        final failureOrSuccess = await _apiRequests.getPrematchGames(
          Query(sport: state.category!, page: event.page),
        );
        failureOrSuccess.fold(
            (l) => emit(
                  state.copyWith(status: LoadingStatus.failure),
                ), (r) {
          updateGamesList(r);
          emit(
            state.copyWith(
              games: [
                ..._selectGames(category: state.category!, isLive: false)
              ],
              status: LoadingStatus.success,
              nextPage: event.page + 1,
            ),
          );
        });
      }
    });
    on<GameTypeSet>((event, emit) async {
      emit(BettingState(
          category: event.category,
          isLive: event.isLive,
          profit: state.profit,
          showcaseStatus: state.showcaseStatus,
          bets: [..._selectBets()]));
    });
    on<LoadLiveGamesRequested>((event, emit) async {
      if (state.category != null) {
        emit(state.copyWith(status: LoadingStatus.loading));
        final failureOrSuccess = await _apiRequests.getLiveGames(
          Query(sport: state.category!),
        );
        failureOrSuccess.fold(
            (l) => emit(
                  state.copyWith(status: LoadingStatus.failure),
                ), (r) {
          updateGamesList(r);
          emit(
            state.copyWith(
              games: [..._selectGames(category: state.category!, isLive: true)],
              status: LoadingStatus.success,
              nextPage: null,
            ),
          );
        });
      }
    });
    on<GetOddsRequested>((event, emit) async {
      final shouldLoad = !_loadedGameIds.contains(event.gameId);
      if (shouldLoad) {
        final failureOrSuccess = await _apiRequests.getOdds(event.gameId);
        failureOrSuccess.fold((l) => null, (r) {
          _loadedGameIds.add(event.gameId);
          final game =
              _games.where((element) => element.gameId == event.gameId).first;
          final index = _games.indexOf(game);
          final newGame = game.copyWith(odd: r);
          _games.replaceRange(index, index + 1, [newGame]);
          emit(
            state.copyWith(
              games: [
                ..._selectGames(
                    category: state.category!, isLive: state.isLive!)
              ],
              status: LoadingStatus.success,
            ),
          );
        });
      }
    });
    on<BetAdded>((event, emit) {
      final game =
          _games.where((element) => element.gameId == event.gameId).first;
      final index = _games.indexOf(game);
      final newGame = game.copyWith(oddOption: event.option);
      _games.replaceRange(index, index + 1, [newGame]);
      emit(
        state.copyWith(
          games: [
            ..._selectGames(category: state.category!, isLive: state.isLive!)
          ],
          status: LoadingStatus.success,
          bets: [..._selectBets()],
        ),
      );
    });
    on<BetRemoved>((event, emit) {
      final game =
          _games.where((element) => element.gameId == event.gameId).first;
      final index = _games.indexOf(game);
      final newGame = game.copyWith(oddOption: OddOption.pure);
      _games.replaceRange(index, index + 1, [newGame]);
      final bets = [..._selectBets()];
      emit(
        state.copyWith(
            games: [
              ..._selectGames(category: state.category!, isLive: state.isLive!)
            ],
            status: LoadingStatus.success,
            bets: bets,
            profit: _calculateProfit(amount: state.bettingAmount, bets: bets)),
      );
    });
    on<BettingAmountChanged>((event, emit) {
      final profit = _calculateProfit(amount: event.amount, bets: state.bets);
      emit(state.copyWith(profit: profit, bettingAmount: event.amount));
    });
    on<ShowcaseStarted>((event, emit) {
      emit(state.copyWith(showcaseStatus: ShowcaseStatus.started));
    });
    on<ShowcaseFinished>((event, emit) {
      emit(state.copyWith(showcaseStatus: ShowcaseStatus.finished));
    });
  }

  void updateGamesList(List<Game> r) {
    final newGames = r
        .where((element) => !_games.any((e) => e.gameId == element.gameId))
        .toList();
    _games.addAll(newGames);
  }

  List<Game> _selectGames(
      {required SportCategory category, required bool isLive}) {
    return _games
        .where(
            (element) => element.sport == category && element.isLive == isLive)
        .toList();
  }

  List<Game> _selectBets() {
    return _games
        .where((element) => element.oddOption != OddOption.pure)
        .toList();
  }

  double _calculateProfit({required double amount, required List<Game> bets}) {
    final profit = bets.fold<double>(0.0, (previousValue, element) {
      if (element.oddOption == OddOption.home) {
        return previousValue + element.odd!.homeOdd! * amount;
      } else if (element.oddOption == OddOption.away) {
        return previousValue + element.odd!.awayOdd! * amount;
      } else {
        return previousValue + element.odd!.drawOdd! * amount;
      }
    });
    return profit;
  }
}
