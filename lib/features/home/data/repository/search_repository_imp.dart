
import 'package:dartz/dartz.dart';


import '../../../../core/data/exception_handler.dart';
import '../../../../core/data/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repository/search_repository.dart';
import '../data_sources/search_api.dart';
import '../models/requests.dart';
import '../models/mapper.dart';


class SearchRepositoryImp extends SearchRepository {
  final SearchServiceClient _searchServiceClient;
  final NetworkInfo _networkInfo;

  SearchRepositoryImp(
    this._searchServiceClient,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<Book>>> searchForBook(
      SearchFooBookRequest searchFooBookRequest) async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    }

    try {
      final response = await _searchServiceClient.searchForBook(
          bookName: searchFooBookRequest.searchWord);
      return Right(response.toDomain());
      // return Left(Failure(ApiInternalStatus.failure,
      //     response.message ?? ResponseMessage.defaultError));

    } catch (e) {
      return Left(ExceptionHandler.handle(e).failure);
    }
  }
}
