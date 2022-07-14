import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:discover/song_list/bloc/song_list_bloc.dart';
import 'package:discover/song_list/song_list.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:fpmi_music_band/widgets/app_bar_widget.dart';
import 'package:fpmi_music_band/widgets/app_tab_bar_widget.dart';
import 'package:shared_dependencies/bloc.dart';

class DiscoverForm extends StatefulWidget {
  @override
  DiscoverFormState createState() => DiscoverFormState();
}

class DiscoverFormState extends State<DiscoverForm>
    with TickerProviderStateMixin {
  static const int _recommendedTabIndex = 0;
  static const int _popularTabIndex = 1;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  AppTabBarWidget get _tabBar => AppTabBarWidget(
        controller: _tabController,
        bgColorTab: AppTheme.inactivePrimaryColor,
        indicatorColor: AppTheme.activeColor,
        labelColor: AppTheme.primaryColor,
        unselectedLabelColor: AppTheme.primaryColor,
        labelStyle: AppFonts.bodyBold,
        padding: const EdgeInsets.only(
          bottom: Dimensions.PADDING_24,
          left: Dimensions.PADDING_24,
          right: Dimensions.PADDING_24,
        ),
        tabs: <Tab>[
          Tab(
            text: AppLocalizations.ofGlobalContext('tabToRecommended'),
          ),
          Tab(
            text: AppLocalizations.ofGlobalContext('tabToPopular'),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        automaticallyImplyLeading: false,
        height: 140,
        centerTitle: true,
        title: const Text(
          'Discover',
          style: AppFonts.headline3,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.search),
          )
        ],
        bottom: _tabBar,
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        BlocProvider<SongListBloc>(
          create: (BuildContext context) => SongListBloc(
            appRouter: appLocator.get<AppRouter>(),
            getTopTracksUseCase: appLocator.get<GetTopTracksUseCase>(),
          )..add(FetchRecommendedSongs()),
          child: const SongList(listKey: 'recommended'),
        ),
        BlocProvider<SongListBloc>(
          create: (BuildContext context) => SongListBloc(
            appRouter: appLocator.get<AppRouter>(),
            getTopTracksUseCase: appLocator.get<GetTopTracksUseCase>(),
          )..add(FetchPopularSongs()),
          child: const SongList(listKey: 'popular'),
        ),
      ]),
    );
  }
}