import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/connection_error_view/connection_error.dart';
import 'package:fpmi_music_band/feature/home/home.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';
import 'package:shared_dependencies/network.dart';

import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthorizationState> {
  final AppRouter _appRouter;
  final SignInUseCase _signInUseCase;

  AuthBloc({
    required AppRouter appRouter,
    required SignInUseCase signInUseCase,
  })  : _appRouter = appRouter,
        _signInUseCase = signInUseCase,
        super(const AuthorizationState(
            username: '', password: '', needRegistration: false)) {
    on<SignInEvent>(_onSignInEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<OnRegisteredEvent>(_onOnRegisteredEvent);
  }

  Future<void> _onSignInEvent(
      SignInEvent event, Emitter<AuthorizationState> emit) async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _appRouter.push(ConnectionError.page());
      emit(state);
    }
    if (event.username.isNotEmpty && event.password.isNotEmpty) {
      _signInUseCase.execute(<String>[event.username, event.password]);
      _appRouter.replace(Home.page);
      emit(state.copyWith(
          username: event.username,
          password: event.password,
          needRegistration: false));
    }
  }

  Future<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthorizationState> emit) async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _appRouter.push(ConnectionError.page());
      emit(state);
    }
    emit(state.copyWith(
        username: state.username,
        password: state.password,
        needRegistration: true));
  }

  Future<void> _onOnRegisteredEvent(
      OnRegisteredEvent event, Emitter<AuthorizationState> emit) async {
    emit(state.copyWith(
        username: state.username,
        password: state.password,
        needRegistration: false));
  }
}
