import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/home/sports_tab_bar.dart';
import 'package:sporting_winnings/src/sport_tabs/basketball_tab.dart';
import 'package:sporting_winnings/src/sport_tabs/hockey_tab.dart';
import 'package:sporting_winnings/src/sport_tabs/soccer_tab.dart';
import 'package:sporting_winnings/src/sport_tabs/tennis_tab.dart';

class HomeTab extends StatelessWidget {
  final VoidCallback onTap;
  const HomeTab({
    Key? key,
    required this.onTap,
  }) : super(key: key);

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
              SoccerTab(isLive: false, onTap: onTap),
              TennisTab(isLive: false, onTap: onTap),
              BasketBallTab(
                isLive: false,
                onTap: onTap,
              ),
              HockeyTab(isLive: false, onTap: onTap),
            ],
          ),
        ),
      ),
    );
  }
}
