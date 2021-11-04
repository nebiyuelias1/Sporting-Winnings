import 'package:flutter/material.dart';

import '../custom_theme.dart';

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
            _ColumnLeft(),
            _ColumnRight(),
          ],
        ),
      ),
    );
  }
}

class _ColumnLeft extends StatelessWidget {
  static const teamsStyle =
      TextStyle(color: CustomColor.teamsColor, fontSize: 14);

  const _ColumnLeft({Key? key}) : super(key: key);

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

class _ColumnRight extends StatelessWidget {
  const _ColumnRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        _BetOption(
          header: 'T1',
          selected: true,
        ),
        SizedBox(
          width: 8.0,
        ),
        _BetOption(
          header: 'DRAW',
          selected: false,
        ),
        SizedBox(
          width: 8.0,
        ),
        _BetOption(
          header: 'T2',
          selected: false,
        ),
      ],
    );
  }
}

class _BetOption extends StatelessWidget {
  final String header;
  final bool selected;

  const _BetOption({Key? key, required this.header, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          header,
          style: const TextStyle(
            fontSize: 12,
            color: CustomColor.betOptionHeaderTextColor,
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          width: 38,
          height: 30,
          decoration: BoxDecoration(
            color: selected
                ? CustomColor.betOptionBackgroundColor.withOpacity(0.4)
                : CustomColor.betOptionBackgroundColor,
            border: Border.all(
              width: 0.6,
              color: selected
                  ? CustomColor.betOptionBorderColor.withOpacity(0.4)
                  : CustomColor.betOptionBorderColor,
            ),
          ),
          child: Center(
            child: Text(
              '12.22',
              style: TextStyle(
                color: selected
                    ? CustomColor.betOptionTextColor.withOpacity(0.4)
                    : CustomColor.betOptionTextColor,
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
