import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:discover/bloc/discover_bloc.dart';
import 'package:discover/search/search_form.dart';
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
        labelStyle: AppFonts.sfUi14Bold.copyWith(
          color: AppTheme.activeColor,
        ),
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
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      builder: (BuildContext context, DiscoverState state) => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: state.pageController,
        children: <Widget>[
          Scaffold(
            appBar: AppBarWidget(
              automaticallyImplyLeading: false,
              height: 140,
              centerTitle: true,
              title: Text(
                'Discover',
                style: AppFonts.sfUi18Bold.copyWith(
                  color: AppTheme.activeColor,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    BlocProvider.of<DiscoverBloc>(context).add(SearchEvent());
                  },
                  icon: SvgPicture.asset(AppImages.search),
                )
              ],
              bottom: _tabBar,
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                BlocProvider<SongListBloc>(
                  create: (BuildContext context) => SongListBloc(
                    getPreferredGenresUseCase:
                        appLocator.get<GetPreferredGenresUseCase>(),
                    getRecommendedTracksUseCase:
                        appLocator.get<GetRecommendedTracksUseCase>(),
                    appRouter: appLocator.get<AppRouter>(),
                    getTopTracksUseCase: appLocator.get<GetTopTracksUseCase>(),
                  )..add(FetchRecommendedSongs()),
                  child: const SongList(listKey: 'recommended'),
                ),
                BlocProvider<SongListBloc>(
                  create: (BuildContext context) => SongListBloc(
                    getPreferredGenresUseCase:
                        appLocator.get<GetPreferredGenresUseCase>(),
                    getRecommendedTracksUseCase:
                        appLocator.get<GetRecommendedTracksUseCase>(),
                    appRouter: appLocator.get<AppRouter>(),
                    getTopTracksUseCase: appLocator.get<GetTopTracksUseCase>(),
                  )..add(FetchPopularSongs()),
                  child: const SongList(listKey: 'popular'),
                ),
              ],
            ),
          ),
          SearchForm(),
        ],
      ),
    );
  }
}
