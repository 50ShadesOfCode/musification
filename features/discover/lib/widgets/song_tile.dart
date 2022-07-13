import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongTile extends StatelessWidget {
  final Song song;

  const SongTile({
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.primaryColor,
      elevation: 0,
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(vertical: Dimensions.SPACE_8),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 41,
                        height: 41,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(song.imageUrl),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              song.title,
                              style: AppFonts.bodyBold,
                            ),
                            Text(
                              song.artist,
                              style: AppFonts.bodyRegular.copyWith(
                                color: AppTheme.inactiveColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      song.duration,
                      style: AppFonts.bodyRegular
                          .copyWith(color: AppTheme.inactiveColor),
                    ),
                    IconButton(
                        color: AppTheme.inactiveColor,
                        icon: SvgPicture.asset(AppImages.moreVertical),
                        onPressed: () {}),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
