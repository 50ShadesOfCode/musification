import 'package:core_ui/core_ui.dart';
import 'package:discover/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependencies/bloc.dart';

class SearchForm extends StatefulWidget {
  @override
  SearchFormState createState() => SearchFormState();
}

class SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) => Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: Text('Cancel'),
            onPressed: () {},
          ),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.inactiveSecondaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.secondaryColor, width: 15),
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  label: Text('Enter album, track or artist'),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      /* Clear the search field */
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
