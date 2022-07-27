import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpmi_music_band/feature/home/player_bloc/player_bloc.dart';
import 'package:just_audio/just_audio.dart';
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
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  enableInfiniteScroll: false,
                  initialPage: state.index,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
