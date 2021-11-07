part of 'betting_bloc.dart';

abstract class BettingEvent extends Equatable {
  const BettingEvent();
}

class LoadRequested extends BettingEvent {
  final int page;

  const LoadRequested({this.page = 1});

  @override
  List<Object?> get props => [page];
}

class LoadLiveGamesRequested extends BettingEvent {
  @override
  List<Object?> get props => [];
}

class GameTypeSet extends BettingEvent {
  final SportCategory category;
  final bool isLive;

  const GameTypeSet({required this.category, required this.isLive});

  @override
  List<Object?> get props => [category, isLive];
}

class GetOddsRequested extends BettingEvent {
  final String gameId;

  const GetOddsRequested(this.gameId);

  @override
  List<Object?> get props => [gameId];
}

class BetAdded extends BettingEvent {
  final String gameId;
  final OddOption option;

  const BetAdded({required this.option, required this.gameId});

  @override
  List<Object?> get props => [option, gameId];
}

class BetRemoved extends BettingEvent {
  final String gameId;

  const BetRemoved(this.gameId);

  @override
  List<Object?> get props => [gameId];
}

class BettingAmountChanged extends BettingEvent {
  final double amount;

  const BettingAmountChanged(this.amount);

  @override
  List<Object?> get props => [amount];
}
