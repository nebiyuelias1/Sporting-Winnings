import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/home/tabs/sports_tab_bar.dart';

import '../betting_list_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: CustomColor.bodyBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const SportsTabBar(),
        ),
        body:  Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: const [
              BettingListItem(),
              BettingListItem(),
              BettingListItem(),
            ],
          ),
        ),
      ),
    );
  }
}
