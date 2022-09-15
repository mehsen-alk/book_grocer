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
      emit(LoginInProgress());
      (await _repository.login(event.loginRequest)).fold((failure) {
        emit(LoginFailed(failure.message));
      }, (_) {
        emit(LoginSuccess());

        // TODO: _authPreferences.setUserLoggedIn();
      });
    });

    // register
    on<RegisterButtonPressed>((event, emit) async {
      print('hi');
      emit(RegisterInProgress());
      (await _repository.register(event.registerRequest)).fold((failure) {
        emit(RegisterFailed(failure.message));
      }, (_) {
        emit(RegisterSuccess());

        // TODO: _authPreferences.setUserLoggedIn();
      });
    });
  }
}
