import '../data_sources/error_handler.dart';

class LoginResponse {
  AuthResultStatus status;
  String name;

  LoginResponse({this.status = AuthResultStatus.undefined, this.name = ''});
}

class Authentication {
  String name;

  Authentication(this.name);
}
