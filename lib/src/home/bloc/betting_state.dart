part of 'betting_bloc.dart';

enum LoadingStatus { pure, loading, success, failure }
enum ShowcaseStatus { pure, started, finished }

class BettingState extends Equatable {
  final List<Game> games;
  final List<Game> bets;
  final LoadingStatus status;
  final SportCategory? category;
  final bool? isLive;
  final int? nextPage;
  final double profit;
  final double bettingAmount;
  final ShowcaseStatus showcaseStatus;

  const BettingState({
    this.games = const [],
    this.bets = const [],
    this.status = LoadingStatus.pure,
    this.nextPage,
    this.category,
    this.isLive,
    this.profit = 0,
    this.bettingAmount = 0,
    this.showcaseStatus = ShowcaseStatus.pure,
  });

  @override
  List<Object?> get props => [
        games,
        status,
        category,
        nextPage,
        isLive,
        bets,
        profit,
        bettingAmount,
        showcaseStatus
      ];

  BettingState copyWith(
      {List<Game>? games,
      LoadingStatus? status,
      int? nextPage,
      SportCategory? category,
      bool? isLive,
      List<Game>? bets,
      double? profit,
      double? bettingAmount,
      ShowcaseStatus? showcaseStatus}) {
    return BettingState(
      games: games ?? this.games,
      status: status ?? this.status,
      nextPage: nextPage ?? this.nextPage,
      category: category ?? this.category,
      isLive: isLive ?? this.isLive,
      bets: bets ?? this.bets,
      profit: profit ?? this.profit,
      bettingAmount: bettingAmount ?? this.bettingAmount,
      showcaseStatus: showcaseStatus ?? this.showcaseStatus,
    );
  }
}
