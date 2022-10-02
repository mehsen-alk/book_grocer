import 'package:book_grocer/features/home/data/models/mapper.dart';
import 'package:dartz/dartz.dart';

import 'package:book_grocer/core/data/failure.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:book_grocer/features/home/domain/repository/home_repository.dart';

import '../../../../core/data/exception_handler.dart';
import '../../../../core/network/network_info.dart';
import '../data_sources/home_api.dart';

class HomeRepositoryImpl extends HomeRepository {
  final NetworkInfo _networkInfo;
  final HomeServiceClient _homeServiceClient;
  HomeRepositoryImpl(this._networkInfo,this._homeServiceClient);

  @override
  Future<Either<Failure, List<HomeBookInfo>>> getBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.bookListInfo();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }
}
