import 'package:core/src/global_context.dart';
import 'package:domain/domain.dart';
import 'package:fpmi_music_band/router/app_route_information_parser.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/getit.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

class AppDI {
  void initDependencies() {
    appLocator.registerSingleton<AppExceptionMapper>(
      AppExceptionMapper(),
    );
    final AppRouter appRouter = AppRouter();

    appLocator.registerSingleton<AppRouter>(appRouter);
    appLocator.registerSingleton<AppRouteInformationParser>(
      AppRouteInformationParser(),
    );

    appLocator.registerLazySingleton<GlobalContext>(() => GlobalContext(
        getContext: () => appRouter.navigatorKey.currentContext!));
  }
}
