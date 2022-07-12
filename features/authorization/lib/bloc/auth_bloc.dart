import 'package:domain/domain.dart';
import 'package:fpmi_music_band/feature/error_view/error.dart';
import 'package:fpmi_music_band/feature/home/home.dart';
import 'package:fpmi_music_band/feature/preferences/preferences.dart';
import 'package:fpmi_music_band/router/router.dart';
import 'package:shared_dependencies/bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthorizationState> {
  final AppRouter _appRouter;
  final SignInUseCase _signInUseCase;
  final GetPreferredUseCase _getPreferredUseCase;
  final AppExceptionMapper _exceptionMapper;

  AuthBloc({
    required AppRouter appRouter,
    required SignInUseCase signInUseCase,
    required GetPreferredUseCase getPreferredUseCase,
    required AppExceptionMapper exceptionMapper,
  })  : _appRouter = appRouter,
        _signInUseCase = signInUseCase,
        _getPreferredUseCase = getPreferredUseCase,
        _exceptionMapper = exceptionMapper,
        super(const AuthorizationState(
            username: '', password: '', needRegistration: false)) {
    on<SignInEvent>(_onSignInEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<OnRegisteredEvent>(_onOnRegisteredEvent);
  }

  Future<void> _onSignInEvent(
      SignInEvent event, Emitter<AuthorizationState> emit) async {
    try {
      if (validateCredentials(event.username, event.password)) {
        try {
          _signInUseCase.execute(<String>[event.username, event.password]);
        } catch (e) {
          _appRouter.push(
              ErrorRoute.page(_exceptionMapper.mapExceptionToErrorText(e)));
          emit(state);
          return;
        }
        if (_getPreferredUseCase.execute(NoParams()).isEmpty) {
          _appRouter.replace(Preferences.page());
          emit(state.copyWith(
            username: event.username,
            password: event.password,
            needRegistration: false,
          ));
<<<<<<< HEAD
          return;
=======
>>>>>>> 176816e (Add genre preferences screen.)
        } else {
          _appRouter.replace(Home.page);
          emit(state.copyWith(
            username: event.username,
            password: event.password,
            needRegistration: false,
          ));
<<<<<<< HEAD
          return;
        }
=======
        }
        emit(state.copyWith(
          username: event.username,
          password: event.password,
          needRegistration: false,
        ));
>>>>>>> 176816e (Add genre preferences screen.)
      }
    } on AppException catch (e) {
      _appRouter
          .push(ErrorRoute.page(_exceptionMapper.mapExceptionToErrorText(e)));
    }
  }

  Future<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthorizationState> emit) async {
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

//TODO : Add validation
bool validateCredentials(String username, String password) {
  if (username.isNotEmpty && password.isNotEmpty) {
    return true;
  }
  return false;
}
