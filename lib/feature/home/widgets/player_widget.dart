import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/home/player_bloc/player_bloc.dart';
import 'package:shared_dependencies/bloc.dart';

class PlayerWidget extends StatefulWidget {
  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  double _slider = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, AppPlayerState>(
        builder: (BuildContext context, AppPlayerState state) {
      if (state.isPlaying) {
        return Container(
          decoration: const BoxDecoration(color: AppTheme.primaryColor),
          height: Dimensions.ITEM_HEIGHT_56,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: Dimensions.SPACE_8),
          child: InkWell(
            onTap: () {
              BlocProvider.of<PlayerBloc>(context).add(OpenPlayerEvent());
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
                              state.playingEntity!.imageUrl,
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
                                state.playingEntity!.title,
                                style: AppFonts.sfUi14Bold.copyWith(
                                  color: AppTheme.activeColor,
                                ),
                              ),
                              Text(
                                state.playingEntity!.artist,
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
                      state.playingEntity!.duration,
                      style: AppFonts.sfUi14Regular
                          .copyWith(color: AppTheme.inactivePrimaryColor),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      color: AppTheme.inactivePrimaryColor,
                      icon: state.audioPlayer.playerState.playing
                          ? const Icon(CupertinoIcons.pause)
                          : const Icon(CupertinoIcons.play),
                      onPressed: () {
                        BlocProvider.of<PlayerBloc>(context).add(
                          state.audioPlayer.playerState.playing
                              ? PauseEvent()
                              : ResumeEvent(),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      } else {
        return const SizedBox.shrink(); //empty widget
      }
    });
  }
}
