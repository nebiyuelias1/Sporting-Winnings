import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_theme.dart';

class BettingOption extends StatelessWidget {
  final String header;
  final bool selected;

  const BettingOption({Key? key, required this.header, required this.selected})
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