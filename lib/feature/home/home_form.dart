import 'package:core_ui/core_ui.dart';
import 'package:discover/discover.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/home/home_bloc/home_bloc.dart';
import 'package:fpmi_music_band/feature/home/home_navigation_item.dart';
import 'package:fpmi_music_band/feature/home/mapper/home_navigation_item_mapper.dart';
import 'package:fpmi_music_band/feature/home/player_bloc/player_bloc.dart';
import 'package:fpmi_music_band/feature/home/widgets/player_widget.dart';
import 'package:shared_dependencies/bloc.dart';

class HomeForm extends StatefulWidget {
  @override
  HomeFormState createState() => HomeFormState();
}

class HomeFormState extends State<HomeForm> with TickerProviderStateMixin {
  late TabController _tabController;

  final List<HomeNavigationItem> _tabs = <HomeNavigationItem>[
    ...HomeNavigationItem.values
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: HomeNavigationItem.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                DiscoverForm(),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  /*BlocBuilder<PlayerBloc, AppPlayerState>(
                    builder: (BuildContext context, AppPlayerState state) =>
                        PlayerWidget(
                      playingEntity: state.playingEntity,
                    ),
                  ),*/
                  Container(
                    height: 50,
                  ),
                  Container(
                    color: AppTheme.primaryColor,
                    height: Dimensions.ITEM_HEIGHT_56,
                    child: TabBar(
                      labelPadding: EdgeInsets.zero,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      tabs: _tabs
                          .map((HomeNavigationItem item) => item.toView(
                                isSelected: state.selectedTab == item,
                              ))
                          .toList(),
                      onTap: (int index) {
                        BlocProvider.of<HomeBloc>(context).add(
                          ChangeTab(tab: _tabs[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
