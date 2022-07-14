import 'package:core_ui/core_ui.dart';
import 'package:discover/song_list/bloc/song_list_bloc.dart';
import 'package:discover/widgets/song_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';

class SongList extends StatefulWidget {
  final String listKey;
  const SongList({
    required this.listKey,
  });

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  late String listKey;

  @override
  void initState() {
    super.initState();
    listKey = widget.listKey;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongListBloc, SongListState>(
        builder: (BuildContext context, SongListState state) {
      if (state.fetchingPopularInProgressState) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppTheme.secondaryColor,
          ),
        );
      }
      return ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.separated(
          itemCount: listKey == 'popular'
              ? state.popularSongs.length
              : state.recommendedSongs.length,
          itemBuilder: (BuildContext context, int index) {
            return SongTile(
              song: listKey == 'popular'
                  ? state.popularSongs[index]
                  : state.recommendedSongs[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: 100,
              padding: EdgeInsets.zero,
              height: 0.5,
              decoration: const BoxDecoration(
                color: AppTheme.secondaryColor,
              ),
            );
          },
        ),
      );
    });
  }
}
