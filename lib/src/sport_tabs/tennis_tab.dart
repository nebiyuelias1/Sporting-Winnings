import 'package:flutter/material.dart';
import 'package:sporting_winnings/src/home/custom_list_view.dart';
import 'package:sporting_winnings/src/home/data/models/sport_category.dart';

class TennisTab extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLive;
  const TennisTab({
    Key? key,
    required this.isLive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      category: SportCategory.tennis,
      isLive: isLive,
      onTap: onTap,
    );
  }
}
