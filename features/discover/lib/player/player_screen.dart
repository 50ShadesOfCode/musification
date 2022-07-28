import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:discover/player/widgets/seek_bar.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpmi_music_band/feature/home/player_bloc/player_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_dependencies/bloc.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, AppPlayerState>(
      builder: (BuildContext context, AppPlayerState state) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              BlocProvider.of<PlayerBloc>(context).add(HidePlayerEvent());
            },
            icon: const Icon(
              CupertinoIcons.chevron_down,
            ),
          ),
          centerTitle: true,
          title: Column(
            children: <Widget>[
              Text(
                'Now playing',
                style: AppFonts.sfUi14Regular.copyWith(
                  color: AppTheme.secondaryColor,
                ),
              ),
              Text(
                AppLocalizations.ofGlobalContext(state.songQueue.title + 'Key'),
                style: AppFonts.sfUi18Bold.copyWith(
                  color: AppTheme.activeColor,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CarouselSlider.builder(
                carouselController: state.carouselController,
                itemCount: state.songQueue.queue.length,
                itemBuilder: (BuildContext context, int index, int realIndex) =>
                    Container(
                  width: 213,
                  height: 213,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(state.playingEntity!.imageUrl),
                ),
                options: CarouselOptions(
                  //TODO: Add onpagechangedcallback
                  autoPlay: false,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: state.index,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImages.moreVertical,
                      width: 20,
                      height: 20,
                    ),
                    color: AppTheme.activeColor,
                  )
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    StreamBuilder<PositionData>(
                      stream: Rx.combineLatest3<Duration, Duration, Duration?,
                          PositionData>(
                        state.audioPlayer.positionStream,
                        state.audioPlayer.bufferedPositionStream,
                        state.audioPlayer.durationStream,
                        (Duration position, Duration bufferedPosition,
                                Duration? duration) =>
                            PositionData(position, bufferedPosition,
                                duration ?? Duration.zero),
                      ),
                      builder: (BuildContext context,
                          AsyncSnapshot<PositionData> snapshot) {
                        final PositionData? positionData = snapshot.data;
                        return SeekBar(
                          duration: positionData?.duration ?? Duration.zero,
                          position: positionData?.position ?? Duration.zero,
                          bufferedPosition:
                              positionData?.bufferedPosition ?? Duration.zero,
                          onChangeEnd: state.audioPlayer.seek,
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
