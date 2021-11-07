import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sporting_winnings/src/home/data/models/odd_option.dart';
import 'package:sporting_winnings/src/home/data/models/sport_category.dart';
import 'package:sporting_winnings/src/home/data/models/team.dart';

import 'odd.dart';

part 'game.g.dart';

@JsonSerializable(
    createToJson: false, explicitToJson: true, fieldRename: FieldRename.snake)
class Game extends Equatable {
  final String gameId;
  @JsonKey(fromJson: _timeFromJson)
  final DateTime time;
  final String timeStatus;
  final SportCategory sport;
  final Team home;
  final Team away;
  final bool isLive;
  final Odd? odd;
  final OddOption oddOption;

  const Game({
    required this.gameId,
    required this.time,
    required this.timeStatus,
    required this.home,
    required this.away,
    required this.sport,
    required this.isLive,
    this.odd,
    this.oddOption = OddOption.pure,
  });

  Game copyWith({Odd? odd, OddOption? oddOption}) => Game(
        gameId: gameId,
        time: time,
        timeStatus: timeStatus,
        home: home,
        away: away,
        sport: sport,
        isLive: isLive,
        odd: odd ?? this.odd,
        oddOption: oddOption ?? this.oddOption,
      );

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  static DateTime _timeFromJson(String time) {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(time) * 1000);
  }

  @override
  List<Object?> get props =>
      [gameId, time, timeStatus, home, away, sport, isLive, odd, oddOption];
}
