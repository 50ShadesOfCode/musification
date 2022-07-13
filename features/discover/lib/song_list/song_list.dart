import 'package:discover/song_list/bloc/song_list_bloc.dart';
import 'package:discover/widgets/song_tile.dart';
import 'package:domain/domain.dart';
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
      builder: (BuildContext context, SongListState state) =>
          ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
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
        ),
      ),
    );
  }
}
