import 'package:domain/domain.dart';

class GetPreferredUseCase extends UseCase<List<String>, NoParams> {
  final PrefsRepository _prefsRepository;

  GetPreferredUseCase({
    required PrefsRepository prefsRepository,
  }) : _prefsRepository = prefsRepository;

  @override
  List<String> execute(NoParams params) {
    return _prefsRepository.getPreferredGenres();
  }
}
