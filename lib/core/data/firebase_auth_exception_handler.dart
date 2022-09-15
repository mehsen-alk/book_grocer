import '../../config/strings_manager.dart';
import 'exception_handler.dart';
import 'failure.dart';

enum FirebaseAuthExceptions {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  weakPassword,
  forbidden,
  undefined
}

extension AuthResultStatusExtension on FirebaseAuthExceptions {
  Failure getFailure() {
    switch (this) {
      case FirebaseAuthExceptions.successful:
        return Failure(ResponseCode.success, ResponseMessage.success);

      case FirebaseAuthExceptions.emailAlreadyExists:
        return Failure(
            ResponseCode.unauthorized, AppStrings.emailAlreadyExists);

      case FirebaseAuthExceptions.wrongPassword:
        return Failure(ResponseCode.unauthorized, AppStrings.wrongPassword);

      case FirebaseAuthExceptions.invalidEmail:
        return Failure(ResponseCode.unauthorized, AppStrings.invalidEmail);

      case FirebaseAuthExceptions.userNotFound:
        return Failure(ResponseCode.notFound, AppStrings.userNotFound);

      case FirebaseAuthExceptions.userDisabled:
        return Failure(ResponseCode.unauthorized, AppStrings.userDisabled);

      case FirebaseAuthExceptions.operationNotAllowed:
        return Failure(
            ResponseCode.unauthorized, AppStrings.operationNotAllowed);

      case FirebaseAuthExceptions.forbidden:
        return Failure(ResponseCode.forbidden, AppStrings.forbiddenError);

      case FirebaseAuthExceptions.undefined:
        return Failure(ResponseCode.unauthorized, AppStrings.undefined);
      case FirebaseAuthExceptions.weakPassword:
        return Failure(ResponseCode.unauthorized, AppStrings.weakPassword);
    }
  }
}

class FirebaseAuthExceptionHandler {
  static FirebaseAuthExceptions handle(e) {
    print(e.code);
    FirebaseAuthExceptions status;
    switch (e.code) {
      case "invalid-email":
        status = FirebaseAuthExceptions.invalidEmail;
        break;
      case "wrong-password":
        status = FirebaseAuthExceptions.wrongPassword;
        break;
      case "user-not-found":
        status = FirebaseAuthExceptions.userNotFound;
        break;
      case "user-disabled":
        status = FirebaseAuthExceptions.userDisabled;
        break;
      case "operation-not-allowed":
        status = FirebaseAuthExceptions.operationNotAllowed;
        break;
      case "email-already-in-use":
        status = FirebaseAuthExceptions.emailAlreadyExists;
        break;
      case 'weak-password':
        status = FirebaseAuthExceptions.weakPassword;
        break;
      default:
        status = FirebaseAuthExceptions.undefined;
    }
    return status;
  }
}
