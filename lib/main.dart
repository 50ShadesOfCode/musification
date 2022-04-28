import 'package:core/core.dart';
import 'package:fpmi_music_band/application.dart';
import 'package:shared_dependencies/flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appDI.initDependencies();
  runApp(const Application());
}