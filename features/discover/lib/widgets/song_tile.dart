import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpmi_music_band/feature/home/player_bloc/player_bloc.dart';
import 'package:shared_dependencies/bloc.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: Dimensions.SPACE_8),
        child: InkWell(
          onTap: () {
            BlocProvider.of<PlayerBloc>(context).add(PlayEvent(song: song));
          },
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            song.imageUrl,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              song.title,
                              style: AppFonts.sfUi14Bold.copyWith(
                                color: AppTheme.activeColor,
                              ),
                            ),
                            Text(
                              song.artist,
                              style: AppFonts.sfUi14Regular.copyWith(
                                color: AppTheme.inactivePrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    song.duration,
                    style: AppFonts.sfUi14Regular
                        .copyWith(color: AppTheme.inactivePrimaryColor),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      color: AppTheme.inactivePrimaryColor,
                      icon: SvgPicture.asset(
                        AppImages.moreVertical,
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
