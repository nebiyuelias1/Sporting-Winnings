import 'package:sporting_winnings/src/home/data/models/odd.dart';
import 'package:sporting_winnings/src/home/data/models/sport_category.dart';
import 'package:sporting_winnings/src/home/data/models/team.dart';

import 'game.dart';

final sampleGame = Game(
  home: const Team(name: 'Manchester United'),
  away: const Team(name: 'Wolverhampton'),
  gameId: 'sample-id',
  isLive: false,
  sport: SportCategory.soccer,
  time: DateTime.now(),
  timeStatus: '0',
  odd: const Odd(homeOdd: 1.57, drawOdd: 2.95, awayOdd: 4.333),
);
