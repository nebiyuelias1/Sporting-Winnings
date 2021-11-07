import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sporting_winnings/src/custom_icons.dart';
import 'package:sporting_winnings/src/custom_theme.dart';

class SportsTabBar extends StatelessWidget {
  final GlobalKey? globalKey;
  const SportsTabBar({Key? key, this.globalKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (globalKey != null) {
      child = Showcase(
        key: globalKey,
        description: '1. Select Your Category',
        overlayPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: const _CustomTab(icon: CustomIcons.soccer, text: 'Football'),
      );
    } else {
      child = const _CustomTab(icon: CustomIcons.soccer, text: 'Football');
    }
    return TabBar(
      isScrollable: true,
      labelColor: CustomColor.sportsTabBarLabelColor,
      unselectedLabelColor: CustomColor.unselectedLabelColor,
      indicatorColor: CustomColor.primaryColor,
      tabs: [
        child,
        const _CustomTab(icon: CustomIcons.tennis, text: 'Tennis'),
        const _CustomTab(icon: CustomIcons.basketball, text: 'Basketball'),
        const _CustomTab(icon: CustomIcons.icehockey, text: 'Hockey'),
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
