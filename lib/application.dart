import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/router/app_route_information_parser.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:fpmi_music_band/router/router_configuration.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final AppRouter appRouter;
  late final RouteInformationParser<RouteConfiguration> routeInformationParser;

  @override
  void initState() {
    appRouter = appLocator.get<AppRouter>();
    routeInformationParser = appLocator.get<AppRouteInformationParser>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData(
        primarySwatch: AppTheme.colorPrimary,
        scaffoldBackgroundColor: AppTheme.bgPrimaryColor,
      ),*/
      routerDelegate: appRouter,
      routeInformationParser: routeInformationParser,
    );
  }
}
