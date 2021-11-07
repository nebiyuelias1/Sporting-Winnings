import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/custom_icons.dart';
import 'package:sporting_winnings/src/home/data/api_requests/api_requests.dart';
import 'package:sporting_winnings/src/home/tabs/home_tab.dart';
import 'package:sporting_winnings/src/home/tabs/profit_tab.dart';
import 'package:sporting_winnings/src/home/tabs/today_tab.dart';

import 'bloc/betting_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BettingBloc(ApiRequests()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85.0),
          child: AppBar(
            elevation: 0,
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: CustomColor.unselectedLabelColor,
              padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
              indicator: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: CustomColor.indicatorColor,
              ),
              controller: _controller,
              tabs: const [
                Tab(
                  icon: Icon(CustomIcons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(CustomIcons.today),
                  text: 'Today',
                ),
                Tab(
                  icon: Icon(CustomIcons.profit),
                  text: 'Profit',
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<BettingBloc, BettingState>(
          builder: (context, state) {
            return TabBarView(controller: _controller, children: [
              HomeTab(
                onTap: () {
                  _controller.animateTo(2);
                },
              ),
              TodayTab(
                onTap: () {
                  _controller.animateTo(2);
                },
              ),
              const ProfitTab(),
            ]);
          },
        ),
      ),
    );
  }
}
