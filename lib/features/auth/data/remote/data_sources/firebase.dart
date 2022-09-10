import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/requests.dart';
import '../models/responses.dart';
import 'error_handler.dart';

class FirebaseHelper {
  final LoginResponse _loginResponse = LoginResponse();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    // try to login
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: loginRequest.email, password: loginRequest.password);

      if (userCredential.user != null) {
        _loginResponse.status = AuthResultStatus.successful;
      } else {
        _loginResponse.status = AuthResultStatus.undefined;
      }
    } on FirebaseException catch (e1) {
      if (e1.message?.contains('Forbidden') ?? false) {
        _loginResponse.status = AuthResultStatus.forbidden;
      }
    } catch (e) {
      _loginResponse.status = AuthExceptionHandler.handleException(e);
    }

    // try to fetch user data
    try {
      final userData =
          await _firestore.collection('users').doc(loginRequest.email).get();
      _loginResponse.name = userData['name'];
    } catch (e) {
      // TODO: handle this errors
      print('falling in fetching user data: $e');
    }

    return _loginResponse;
  }
}
