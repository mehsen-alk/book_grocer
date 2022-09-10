import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../data/remote/models/requests.dart';
import '../../data/remote/models/responses.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
