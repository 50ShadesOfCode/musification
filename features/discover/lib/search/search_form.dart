import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:discover/bloc/discover_bloc.dart';
import 'package:discover/search/bloc/search_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_dependencies/bloc.dart';

class SearchForm extends StatefulWidget {
  @override
  SearchFormState createState() => SearchFormState();
}

class SearchFormState extends State<SearchForm> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) => Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            TextButton(
              child: Text(
                AppLocalizations.ofGlobalContext('cancel'),
                style: AppFonts.sfUi14Regular.copyWith(
                  color: AppTheme.activeColor,
                ),
              ),
              onPressed: () {
                BlocProvider.of<DiscoverBloc>(context)
                    .add(CancelPressedEvent());
              },
            ),
          ],
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.inactiveSecondaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.secondaryColor, width: 1.5),
            ),
            child: Center(
              child: TextField(
                onChanged: (String value) {
                  BlocProvider.of<SearchBloc>(context).add(
                    UpdateSearchEvent(
                      searchValue: value,
                    ),
                  );
                },
                controller: searchController,
                style: AppFonts.sfUi14Regular.copyWith(
                  color: AppTheme.activeColor,
                ),
                cursorColor: AppTheme.activeColor,
                cursorHeight: 22,
                cursorWidth: 1,
                decoration: InputDecoration(
                  hintText: AppLocalizations.ofGlobalContext('searchLabel'),
                  hintStyle: AppFonts.sfUi14Regular.copyWith(
                    color: AppTheme.secondaryColor,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppImages.search,
                      ),
                      onPressed: () {
                        BlocProvider.of<SearchBloc>(context).add(
                          OnSearchPressedEvent(
                            searchValue: searchController.text,
                          ),
                        );
                      },
                    ),
                  ),
                  suffixIcon: Container(
                    width: 20,
                    height: 20,
                    child: IconButton(
                      icon: const Icon(Icons.clear),
                      color: AppTheme.activeColor,
                      onPressed: searchController.clear,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView.separated(
                itemCount: state.searchHistory.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 0,
                    color: AppTheme.primaryColor,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.SPACE_8,
                        vertical: Dimensions.SPACE_16,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              state.searchHistory[index],
                              style: AppFonts.sfUi14Regular.copyWith(
                                color: AppTheme.secondaryColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<SearchBloc>(context).add(
                                  RemoveHistoryElementEvent(index: index),
                                );
                              },
                              icon: const Icon(
                                CupertinoIcons.clear,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.zero,
                    height: 0.5,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: AppTheme.secondaryColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
