import 'package:domain/domain.dart';

class SetPreferredUseCase extends FutureUseCase<void, List<String>> {
  final PrefsRepository _prefsRepository;

  SetPreferredUseCase({
    required PrefsRepository prefsRepository,
  }) : _prefsRepository = prefsRepository;

  @override
  Future<void> execute(List<String> params) async {
    await _prefsRepository.setPreferredGenres(params);
  }
}
