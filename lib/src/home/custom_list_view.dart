import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sporting_winnings/src/home/betting_list_item.dart';
import 'package:sporting_winnings/src/home/data/models/game.dart';

import 'bloc/betting_bloc.dart';
import 'data/models/sport_category.dart';

class CustomListView extends StatefulWidget {
  final bool isLive;
  final SportCategory category;
  final VoidCallback onTap;

  const CustomListView({
    Key? key,
    required this.category,
    required this.isLive,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final _pagingController = PagingController<int, Game>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    context
        .read<BettingBloc>()
        .add(GameTypeSet(category: widget.category, isLive: widget.isLive));
    _pagingController.addPageRequestListener(_getPage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BettingBloc, BettingState>(
      listener: (context, state) {
        final finishedLoading = state.status == LoadingStatus.failure ||
            state.status == LoadingStatus.success;
        if (finishedLoading) {
          _pagingController.value =
              PagingState(itemList: state.games, nextPageKey: state.nextPage);
        }
      },
      child: PagedListView<int, Game>.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, i) {
            return BettingListItem(
              game: item,
              isLive: widget.isLive,
              onTap: widget.onTap,
            );
          },
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8.0);
        },
      ),
    );
  }

  void _getPage(int pageKey) {
    if (widget.isLive) {
      context.read<BettingBloc>().add(LoadLiveGamesRequested());
    } else {
      context.read<BettingBloc>().add(
            LoadRequested(page: pageKey),
          );
    }
  }
}
