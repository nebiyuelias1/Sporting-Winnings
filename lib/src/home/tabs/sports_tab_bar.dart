import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/custom_icons.dart';
import 'package:sporting_winnings/src/custom_theme.dart';

class SportsTabBar extends StatelessWidget {
  const SportsTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      labelColor: CustomColor.sportsTabBarLabelColor,
      unselectedLabelColor: CustomColor.unselectedLabelColor,
      indicatorColor: CustomColor.primaryColor,
      tabs: [
        _CustomTab(icon: CustomIcons.soccer, text: 'Football'),
        _CustomTab(icon: CustomIcons.tennis, text: 'Tennis'),
        _CustomTab(icon: CustomIcons.basketball, text: 'Basketball'),
        _CustomTab(icon: CustomIcons.icehockey, text: 'Hockey'),
      ],
    );
  }
}

class _CustomTab extends StatelessWidget {
  final IconData icon;
  final String text;

  const _CustomTab({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 8.0,
          ),
          Text(text),
        ],
      ),
    );
  }
}
