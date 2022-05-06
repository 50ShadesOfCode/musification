import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/onboarding/onboarding_page.dart';
import 'package:fpmi_music_band/router/router_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<RouteConfiguration> {
  bool isStartUp = true;
  Uri? initialUri;

  @override
  Future<RouteConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    Uri? uri;
    if (isStartUp && initialUri != null) {
      uri = initialUri;
      isStartUp = false;
    } else {
      uri = Uri?.tryParse(routeInformation.location.toString());
    }
    late Page<dynamic> page;
    if (uri == null) {
      page = Onboarding.page();
    } else {
      final List<String> uriSegments = uri.pathSegments;
      if (uriSegments.isEmpty) {
        page = Onboarding.page();
      }
    }

    return SynchronousFuture<RouteConfiguration>(
      RouteConfiguration(page: page),
    );
  }
}
