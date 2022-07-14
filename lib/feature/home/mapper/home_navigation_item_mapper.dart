import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpmi_music_band/feature/home/home_navigation_item.dart';

extension HomeNavItemViewMapper on HomeNavigationItem {
  String toViewString() {
    switch (this) {
      case HomeNavigationItem.DISCOVER:
        return AppLocalizations.ofGlobalContext('navigationToDiscover');
      case HomeNavigationItem.ALBUMS:
        return AppLocalizations.ofGlobalContext('navigationToAlbums');
      case HomeNavigationItem.ARTISTS:
        return AppLocalizations.ofGlobalContext('navigationToArtists');
      case HomeNavigationItem.FAVOURITE:
        return AppLocalizations.ofGlobalContext('navigationToFavourite');
      case HomeNavigationItem.PROFILE:
        return AppLocalizations.ofGlobalContext('navigationToProfile');
    }
  }

  String _getIconAssetPath() {
    switch (this) {
      case HomeNavigationItem.DISCOVER:
        return AppImages.navigationIconDiscover;
      case HomeNavigationItem.ALBUMS:
        return AppImages.navigationIconAlbums;
      case HomeNavigationItem.ARTISTS:
        return AppImages.navigationIconArtists;
      case HomeNavigationItem.FAVOURITE:
        return AppImages.navigationIconFavourite;
      case HomeNavigationItem.PROFILE:
        return AppImages.navigationIconProfile;
    }
  }

  Widget toView({
    required bool isSelected,
  }) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            _getIconAssetPath(),
            color: isSelected
                ? AppTheme.activeColor
                : AppTheme.inactivePrimaryColor,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          toViewString(),
          style: AppFonts.tips.copyWith(
            color: isSelected
                ? AppTheme.activeColor
                : AppTheme.inactivePrimaryColor,
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
