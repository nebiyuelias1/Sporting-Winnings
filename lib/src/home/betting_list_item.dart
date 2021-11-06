import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/home/betting_option.dart';

import 'betting_teams.dart';

class BettingListItem extends StatelessWidget {
  const BettingListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            BettingTeams(),
            _ColumnRight(),
          ],
        ),
      ),
    );
  }
}

class _ColumnRight extends StatelessWidget {
  const _ColumnRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        BettingOption(
          header: 'T1',
          selected: true,
        ),
        SizedBox(
          width: 8.0,
        ),
        BettingOption(
          header: 'DRAW',
          selected: false,
        ),
        SizedBox(
          width: 8.0,
        ),
        BettingOption(
          header: 'T2',
          selected: false,
        ),
      ],
    );
  }
}
