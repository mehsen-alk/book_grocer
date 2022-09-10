import 'package:dartz/dartz.dart';

import '../../../../core/network/error_handler.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repository/repository.dart';
import '../remote/data_sources/firebase.dart';
import '../remote/models/requests.dart';
import '../remote/models/responses.dart';
import '../remote/data_sources/error_handler.dart';
import '../mapper/mapper.dart';

class RepositoryImp implements Repository {
  final FirebaseHelper _firebaseHelper;
  final NetworkInfo _networkInfo;

  RepositoryImp(this._firebaseHelper, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        LoginResponse loginResponse = await _firebaseHelper.login(loginRequest);

        if (loginResponse.status == AuthResultStatus.successful) {
          return Right(loginResponse.toDomain());
        } else {
          return Left(
            Failure(
              0,
              AuthExceptionHandler.generateExceptionMessage(
                  loginResponse.status),
            ),
          );
        }
      } catch (e) {
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
