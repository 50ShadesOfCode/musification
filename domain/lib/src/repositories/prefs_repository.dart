abstract class PrefsRepository {
  const PrefsRepository();

  List<String> getPreferredGenres();

  Future<void> setPreferredGenres(List<String> preferred);
}
