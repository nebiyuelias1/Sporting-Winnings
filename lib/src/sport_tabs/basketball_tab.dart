import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/home/custom_list_view.dart';
import 'package:sporting_winnings/src/home/data/models/sport_category.dart';

class BasketBallTab extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLive;
  const BasketBallTab({Key? key, required this.isLive, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      category: SportCategory.basketball,
      isLive: isLive,
      onTap: onTap,
    );
  }
}
