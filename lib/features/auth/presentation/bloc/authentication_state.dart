part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class LoginInProgress extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class LoginFailed extends AuthenticationState {
  final String message;

  const LoginFailed(this.message);

  @override
  List<Object?> get props => [];
}
