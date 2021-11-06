import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_theme.dart';

class BettingTeams extends StatelessWidget {
  static const teamsStyle =
      TextStyle(color: CustomColor.teamsColor, fontSize: 14);

  const BettingTeams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: const [
        Text(
          '22:45    15/09/2021',
          style: TextStyle(
            color: CustomColor.dateTimeColor,
            fontSize: 10,
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Text(
          'Manchester United',
          style: teamsStyle,
        ),
        Text(
          'Wolverhampton',
          style: teamsStyle,
        )
      ],
    );
  }
}
