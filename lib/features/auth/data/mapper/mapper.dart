import '../remote/models/responses.dart';

extension LoginResponseMapper on LoginResponse {
  Authentication toDomain() {
    return Authentication(name);
  }
}
