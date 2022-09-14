import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/local/data_sources/auth_prefs.dart';
import '../../data/remote/models/requests.dart';
import '../../domain/repository/repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final Repository _repository;
  final AuthPreferences _authPreferences;
  AuthenticationBloc(this._repository, this._authPreferences)
      : super(AuthenticationInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginInProgress());
      (await _repository.login(event.loginRequest)).fold((failure) {
        emit(LoginFailed(failure.message));
      }, (authentication) {
        emit(LoginSuccess());
        // TODO: after finish auths all stuff _authPreferences.setUserLoggedIn();
        _authPreferences.setUserLoggedIn();
      });
    });
  }

  @override
  void onChange(Change<AuthenticationState> change) {
    super.onChange(change);
    print(change);
  }
}
