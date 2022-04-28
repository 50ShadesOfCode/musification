import 'package:shared_dependencies/flutter.dart';

class GlobalContext {
  final BuildContext Function() _getContext;

  GlobalContext({required BuildContext Function() getContext})
      : _getContext = getContext;

  BuildContext get context => _getContext();
}
