import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/data_sources/auth_prefs.dart';
import '../../data/models/requests.dart';
import '../../domain/repository/repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Repository _repository;
  final AuthPreferences _authPreferences;
  AuthenticationBloc(this._repository, this._authPreferences)
      : super(AuthenticationInitial()) {
    // login
    on<LoginButtonPressed>((event, emit) async {
      emit(AuthenticationInProgress());
      (await _repository.login(event.loginRequest)).fold((failure) {
        emit(AuthenticationFailed(failure.message));
      }, (_) {
        emit(AuthenticationSuccess());

        // TODO: _authPreferences.setUserLoggedIn();
      });
    });

    // register
    on<RegisterButtonPressed>((event, emit) async {
      emit(AuthenticationInProgress());
      (await _repository.register(event.registerRequest)).fold((failure) {
        emit(AuthenticationFailed(failure.message));
      }, (_) {
        emit(AuthenticationSuccess());

        // TODO: _authPreferences.setUserLoggedIn();
      });
    });

    on<SendVerificationCodeButtonPressed>((event, emit) async {
      emit(AuthenticationInProgress());
      (await _repository.resetPassword(event.email)).fold((failure) {
        emit(AuthenticationFailed(failure.message));
      }, (_) {
        emit(ResetPasswordRequestSuccess());
      });
    });
  }
}
