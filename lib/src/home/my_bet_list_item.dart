import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/home/betting_option.dart';
import 'package:sporting_winnings/src/home/betting_teams.dart';

class MyBetListItem extends StatelessWidget {
  const MyBetListItem({Key? key}) : super(key: key);

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
        _RemoveButton()
      ],
    );
  }
}

class _RemoveButton extends StatelessWidget {
  const _RemoveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 30,
      color: CustomColor.removeButtonBackgroundColor,
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
