import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sporting_winnings/src/custom_theme.dart';
import 'package:sporting_winnings/src/custom_icons.dart';
import 'package:sporting_winnings/src/home/tabs/home_tab.dart';
import 'package:sporting_winnings/src/home/tabs/profit_tab.dart';
import 'package:sporting_winnings/src/home/tabs/today_tab.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final _key1 = GlobalKey();
  final _key2 = GlobalKey();
  final _key3 = GlobalKey();
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)!.startShowCase(
        [_key1, _key2, _key3],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            tabs: [
              const Tab(
                icon: Icon(CustomIcons.home),
                text: 'Home',
              ),
              const Tab(
                icon: Icon(CustomIcons.today),
                text: 'Today',
              ),
              Showcase(
                key: _key3,
                description: '3. Calculate your winnings',
                overlayPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: const Tab(
                  icon: Icon(CustomIcons.profit),
                  text: 'Profit',
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          HomeTab(
            globalKey1: _key1,
            globalKey2: _key2,
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
        ],
      ),
    );
  }
}
