import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/home/bloc/betting_bloc.dart';
import 'package:sporting_winnings/src/home/my_bet_list_item.dart';

class ProfitTab extends StatelessWidget {
  const ProfitTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bodyBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _AmountTextField(),
            _BettingListView(),
          ],
        ),
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
            padding: const EdgeInsets.only(left: 62, right: 62, bottom: 8.0),
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: CustomColor.teamsColor,
                fontSize: 24,
              ),
              onChanged: (value) {
                double amount = 0;
                if (value.isNotEmpty) {
                  amount = double.parse(value);
                }
                context.read<BettingBloc>().add(BettingAmountChanged(amount));
              },
              cursorColor: CustomColor.teamsColor,
              decoration: const InputDecoration(
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: CustomColor.teamsColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: CustomColor.teamsColor, width: 2.00),
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
    return BlocBuilder<BettingBloc, BettingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your bets:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: CustomColor.teamsColor,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ...state.bets
                  .map((b) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: MyBetListItem(
                          game: b,
                        ),
                      ))
                  .toList()
            ],
          ),
        );
      },
    );
  }
}

class _Profit extends StatelessWidget {
  static NumberFormat formatter = NumberFormat.decimalPattern();
  const _Profit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BettingBloc, BettingState>(
      buildWhen: (previousState, state) => previousState.profit != state.profit,
      builder: (context, state) {
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
                child: Text(
                  formatter.format(state.profit),
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
      },
    );
  }
}
