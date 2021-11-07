import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_theme.dart';

class BettingOption extends StatelessWidget {
  final String header;
  final double? odd;
  final bool selected;
  final VoidCallback onTap;
  final bool boldHeader;

  const BettingOption(
      {Key? key,
      required this.header,
      required this.selected,
      this.odd,
      required this.onTap,
      this.boldHeader = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              header,
              style: TextStyle(
                fontSize: 12,
                color: CustomColor.betOptionHeaderTextColor,
                fontWeight: boldHeader ? FontWeight.bold : null,
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
                  '$odd',
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
        ),
      ),
    );
  }
}
