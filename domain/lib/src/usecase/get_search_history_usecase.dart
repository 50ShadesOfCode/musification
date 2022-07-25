import 'package:domain/domain.dart';

class GetSearchHistoryUseCase extends UseCase<List<String>, NoParams> {
  final PrefsRepository _prefsRepository;

  GetSearchHistoryUseCase({
    required PrefsRepository prefsRepository,
  }) : _prefsRepository = prefsRepository;

  @override
  List<String> execute(NoParams params) {
    return _prefsRepository.getSearchHistory();
  }
}
