import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/home/tabs/sports_tab_bar.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({Key? key}) : super(key: key);

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
        body: const Text('Home Tab'),
      ),
    );
  }
}
