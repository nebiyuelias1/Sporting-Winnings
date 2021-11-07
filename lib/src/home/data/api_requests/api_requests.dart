import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:sporting_winnings/secrets.dart';
import 'package:sporting_winnings/src/home/data/failures/api_failure.dart';
import 'package:sporting_winnings/src/home/data/models/game.dart';
import 'package:sporting_winnings/src/home/data/models/odd.dart';
import 'package:sporting_winnings/src/home/data/models/query.dart';

import 'package:http/http.dart' as http;

class ApiRequests {
  final List<String> _bookMakers = [
    'Bet365',
    '10Bet',
    'Ladbrokes',
    'YSB88',
    'BetClic',
    'PinnacleSports',
    '188Bet',
    'BWin',
    'BetFair',
    'CloudBet',
    'PaddyPower',
    'SBOBET',
    'TitanBet',
    'BetAtHome',
    'DafaBet',
    'Marathonbet',
    'BetVictor',
    'Interwetten',
    '1XBet',
    'NitrogenSports',
    'BetRegal',
    'CashPoint',
    'Coral',
    'Macauslot',
    'MansionBet',
    'GGBet',
  ];

  Future<Either<ApiFailure, List<Game>>> getPrematchGames(Query query) async {
    final queryParams = query.toJson();
    final uri = Uri.https('spoyer.ru', 'api/en/get.php', {
      ...queryParams,
      'login': apiLogin.toString(),
      'token': apiToken.toString(),
      'task': 'predatapage',
      'day': 'today'
    });

    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return right((jsonBody['games_pre'] as List<dynamic>)
          .map((e) => Game.fromJson({...e, ...queryParams, 'is_live': false}))
          .toList());
    } else {
      return left(ApiFailure(response.body));
    }
  }

  Future<Either<ApiFailure, List<Game>>> getLiveGames(Query query) async {
    final queryParams = query.toJson();
    final uri = Uri.https('spoyer.ru', 'api/en/get.php', {
      ...queryParams,
      'login': apiLogin.toString(),
      'token': apiToken.toString(),
      'task': 'livedata',
    });

    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      return right((jsonBody['games_live'] as List<dynamic>)
          .map((e) => Game.fromJson({...e, ...queryParams, 'is_live': true}))
          .toList());
    } else {
      return left(ApiFailure(response.body));
    }
  }

  Future<Either<ApiFailure, Odd?>> getOdds(String gameId) async {
    final uri = Uri.https('spoyer.ru', 'api/en/get.php', {
      'login': apiLogin.toString(),
      'token': apiToken.toString(),
      'task': 'allodds',
      'game_id': gameId
    });

    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      final resultsMap =
          jsonDecode(response.body)['results'] as Map<String, dynamic>;
      for (var bookMaker in _bookMakers) {
        if (resultsMap.containsKey(bookMaker)) {
          if (resultsMap[bookMaker]['odds'] is Map) {
            final oddsMap =
                resultsMap[bookMaker]['odds'] as Map<String, dynamic>;
            for (var d in oddsMap.values) {
              if (d is Map) {
                final dataOdds = d as Map<String, dynamic>;
                for (var odd in dataOdds.values) {
                  if (odd is Map) {
                    final oddMap = odd as Map<String, dynamic>;
                    final containsKeys = oddMap.containsKey('home_od') ||
                        oddMap.containsKey('draw_od') ||
                        oddMap.containsKey('away_od');

                    if (containsKeys) {
                      return right(Odd.fromJson(oddMap));
                    }
                  }
                }
              }
            }
          }
        }
      }

      return right(null);
    } else {
      return left(ApiFailure(response.body));
    }
  }
}
