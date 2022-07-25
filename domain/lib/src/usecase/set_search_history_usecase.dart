import 'package:domain/domain.dart';

class SetSearchHistoryUseCase extends FutureUseCase<void, List<String>> {
  final PrefsRepository _prefsRepository;

  SetSearchHistoryUseCase({
    required PrefsRepository prefsRepository,
  }) : _prefsRepository = prefsRepository;

  @override
  Future<void> execute(List<String> params) async {
    _prefsRepository.setSearchHistory(params);
  }
}
