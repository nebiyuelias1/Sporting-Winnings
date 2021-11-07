import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/home/betting_option.dart';
import 'package:sporting_winnings/src/home/bloc/betting_bloc.dart';
import 'package:sporting_winnings/src/home/data/models/odd_option.dart';

import 'betting_teams.dart';
import 'data/models/game.dart';

class MyBetListItem extends StatelessWidget {
  final Game game;
  const MyBetListItem({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BettingTeams(game: game),
            _ColumnRight(
              game: game,
            ),
          ],
        ),
      ),
    );
  }
}

class _ColumnRight extends StatelessWidget {
  final Game game;
  const _ColumnRight({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String header;
    double? odd;
    if (game.oddOption == OddOption.home) {
      header = 'T1';
      odd = game.odd!.homeOdd;
    } else if (game.oddOption == OddOption.away) {
      header = 'T2';
      odd = game.odd!.awayOdd;
    } else {
      header = 'DRAW';
      odd = game.odd!.drawOdd;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BettingOption(
          header: header,
          boldHeader: true,
          selected: false,
          odd: odd,
          onTap: () {},
        ),
        const SizedBox(
          width: 8.0,
        ),
        _RemoveButton(
          gameId: game.gameId,
        )
      ],
    );
  }
}

class _RemoveButton extends StatelessWidget {
  final String gameId;

  const _RemoveButton({Key? key, required this.gameId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BettingBloc>().add(BetRemoved(gameId));
      },
      child: Container(
        width: 38,
        height: 30,
        color: CustomColor.removeButtonBackgroundColor,
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
