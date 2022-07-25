class SearchState {
  final String searchText;
  final List<String> searchHistory;
  SearchState({
    required this.searchText,
    required this.searchHistory,
  });

  SearchState copyWith({
    required String searchText,
    required List<String> searchHistory,
  }) {
    return SearchState(
      searchText: searchText,
      searchHistory: searchHistory,
    );
  }
}
