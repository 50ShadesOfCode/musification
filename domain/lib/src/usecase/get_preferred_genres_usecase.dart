import 'package:domain/domain.dart';

class GetPreferredGenresUseCase extends UseCase<List<String>, NoParams> {
  final PrefsRepository _prefsRepository;

  GetPreferredGenresUseCase({
    required PrefsRepository prefsRepository,
  }) : _prefsRepository = prefsRepository;

  @override
  List<String> execute(NoParams params) {
    return _prefsRepository.getPreferredGenres();
  }
}
