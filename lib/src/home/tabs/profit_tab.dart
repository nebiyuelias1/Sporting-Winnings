import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/home/betting_list_item.dart';
import 'package:sporting_winnings/src/home/my_bet_list_item.dart';

class ProfitTab extends StatelessWidget {
  const ProfitTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bodyBackgroundColor,
      body: Column(
        children: const [_AmountTextField(), _BettingListView()],
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.only(bottom: 26, top: 16),
          color: Colors.white,
          child: const _Profit(),
        ),
      ),
    );
  }
}

class _AmountTextField extends StatelessWidget {
  const _AmountTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Enter your bet amount:',
            style: TextStyle(
              fontSize: 12,
              color: CustomColor.teamsColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 62),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: CustomColor.teamsColor,
                fontSize: 24,
              ),
              cursorColor: CustomColor.teamsColor,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColor.teamsColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: CustomColor.teamsColor, width: 1.34),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BettingListView extends StatelessWidget {
  const _BettingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Your bets:',
            style: TextStyle(
              color: CustomColor.teamsColor,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          MyBetListItem(),
          MyBetListItem(),
          MyBetListItem()
        ],
      ),
    );
  }
}

class _Profit extends StatelessWidget {
  static NumberFormat formatter = NumberFormat('#,##,000');
  const _Profit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Profit: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: CustomColor.teamsColor,
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Container(
          decoration: const BoxDecoration(
            color: CustomColor.indicatorColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
            child: Text(
              formatter.format(12344),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
