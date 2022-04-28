import 'package:core/src/global_context.dart';
import 'package:fpmi_music_band/router/app_route_information_parser.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:get_it/get_it.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

class AppDI {
  void initDependencies() {

    final AppRouter appRouter = AppRouter();

    appLocator.registerSingleton<AppRouter>(appRouter);
    appLocator.registerSingleton<AppRouteInformationParser>(
      AppRouteInformationParser(),
    );

    appLocator.registerLazySingleton<GlobalContext>(() => GlobalContext(
        getContext: () => appRouter.navigatorKey.currentContext!));
  }
}
