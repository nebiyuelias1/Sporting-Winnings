import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/home/sports_tab_bar.dart';
import 'package:sporting_winnings/src/sport_tabs/basketball_tab.dart';
import 'package:sporting_winnings/src/sport_tabs/hockey_tab.dart';
import 'package:sporting_winnings/src/sport_tabs/soccer_tab.dart';
import 'package:sporting_winnings/src/sport_tabs/tennis_tab.dart';

class TodayTab extends StatelessWidget {
  final VoidCallback onTap;

  const TodayTab({Key? key, required this.onTap}) : super(key: key);

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
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TabBarView(
            children: [
              SoccerTab(
                isLive: true,
                onTap: onTap,
              ),
              TennisTab(
                isLive: true,
                onTap: onTap,
              ),
              BasketBallTab(
                isLive: true,
                onTap: onTap,
              ),
              HockeyTab(isLive: true, onTap: onTap),
            ],
          ),
        ),
      ),
    );
  }
}
