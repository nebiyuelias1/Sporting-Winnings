import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sporting_winnings/src/home/betting_option.dart';
import 'package:sporting_winnings/src/home/data/models/game.dart';
import 'package:sporting_winnings/src/home/data/models/odd_option.dart';

import 'betting_teams.dart';
import 'bloc/betting_bloc.dart';

class BettingListItem extends StatefulWidget {
  final Game game;
  final bool isLive;
  final VoidCallback onTap;
  final GlobalKey? globalKey;
  final bool shouldAddBlocEvent;

  const BettingListItem({
    Key? key,
    required this.game,
    required this.onTap,
    this.isLive = false,
    this.globalKey,
    this.shouldAddBlocEvent = true,
  }) : super(key: key);

  @override
  State<BettingListItem> createState() => _BettingListItemState();
}

class _BettingListItemState extends State<BettingListItem> {
  @override
  void initState() {
    super.initState();
    if (widget.shouldAddBlocEvent) {
      context.read<BettingBloc>().add(GetOddsRequested(widget.game.gameId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BettingTeams(
                game: widget.game,
                isLive: widget.isLive,
              ),
            ),
            if (widget.game.odd != null)
              Expanded(
                child: _ColumnRight(
                  game: widget.game,
                  onTap: widget.onTap,
                  globalKey: widget.globalKey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ColumnRight extends StatelessWidget {
  final VoidCallback onTap;
  final Game game;
  final GlobalKey? globalKey;
  const _ColumnRight(
      {Key? key, required this.game, required this.onTap, this.globalKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bettingOptionWidget = BettingOption(
      header: 'T1',
      selected: game.oddOption == OddOption.home,
      odd: game.odd!.homeOdd,
      onTap: () {
        context
            .read<BettingBloc>()
            .add(BetAdded(gameId: game.gameId, option: OddOption.home));
        onTap();
      },
    );
    Widget child;
    if (globalKey != null) {
      child = Showcase(
        key: globalKey,
        child: bettingOptionWidget,
        overlayPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        description: '2. Choose an outcome',
      );
    } else {
      child = bettingOptionWidget;
    }
    if (game.odd != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (game.odd!.homeOdd != null) child,
          const SizedBox(
            width: 8.0,
          ),
          if (game.odd!.drawOdd != null)
            BettingOption(
              header: 'DRAW',
              selected: game.oddOption == OddOption.draw,
              odd: game.odd!.drawOdd,
              onTap: () {
                context
                    .read<BettingBloc>()
                    .add(BetAdded(gameId: game.gameId, option: OddOption.draw));
                onTap();
              },
            ),
          const SizedBox(
            width: 8.0,
          ),
          if (game.odd!.awayOdd != null)
            BettingOption(
              header: 'T2',
              selected: game.oddOption == OddOption.away,
              odd: game.odd!.awayOdd,
              onTap: () {
                context
                    .read<BettingBloc>()
                    .add(BetAdded(gameId: game.gameId, option: OddOption.away));
                onTap();
              },
            ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
