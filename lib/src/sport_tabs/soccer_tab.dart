import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporting_winnings/src/home/betting_list_item.dart';
import 'package:sporting_winnings/src/home/bloc/betting_bloc.dart';
import 'package:sporting_winnings/src/home/custom_list_view.dart';
import 'package:sporting_winnings/src/home/data/models/sample_game.dart';
import 'package:sporting_winnings/src/home/data/models/sport_category.dart';

class SoccerTab extends StatelessWidget {
  final GlobalKey? globalKey;
  final VoidCallback onTap;
  final bool isLive;
  const SoccerTab(
      {Key? key, required this.isLive, required this.onTap, this.globalKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BettingBloc, BettingState>(
      builder: (context, state) {
        if (state.showcaseStatus == ShowcaseStatus.started ||
            state.showcaseStatus == ShowcaseStatus.pure) {
          return Column(
            children: [
              BettingListItem(
                game: sampleGame,
                onTap: () {},
                shouldAddBlocEvent: false,
                globalKey: globalKey,
              ),
            ],
          );
        }
        return CustomListView(
          category: SportCategory.soccer,
          isLive: isLive,
          onTap: onTap,
        );
      },
    );
  }
}
