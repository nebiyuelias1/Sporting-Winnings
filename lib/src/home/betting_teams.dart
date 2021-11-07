import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sporting_winnings/src/custom_theme.dart';

import 'data/models/game.dart';

class BettingTeams extends StatelessWidget {
  final Game game;
  final bool isLive;
  static const teamsStyle =
      TextStyle(color: CustomColor.teamsColor, fontSize: 14);

  const BettingTeams({Key? key, required this.game, this.isLive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hm().format(game.time);
    final date = isLive ? 'Today' : DateFormat('dd/MM/y').format(game.time);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '$time    $date',
          style: const TextStyle(
            color: CustomColor.dateTimeColor,
            fontSize: 10,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(
          game.home.name,
          style: teamsStyle,
        ),
        Text(
          game.away.name,
          style: teamsStyle,
        )
      ],
    );
  }
}
