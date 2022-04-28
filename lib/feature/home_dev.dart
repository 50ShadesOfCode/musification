import 'package:shared_dependencies/flutter.dart';

class Home {
  static const String routeName = '/home';

  static Page<void> get page => HomePage();
}

class HomePage extends Page<void> {
  @override
  String get name => Home.routeName;

  @override
  LocalKey get key => const ValueKey<String>(Home.routeName);

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
        settings: this,
        builder: (BuildContext context) => const Center(
              child: Text('home'),
            ));
  }
}
