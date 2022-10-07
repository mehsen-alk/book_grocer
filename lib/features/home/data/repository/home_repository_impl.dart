import 'dart:math';

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

  HomeRepositoryImpl(this._networkInfo, this._homeServiceClient);

  @override
  Future<Either<Failure, List<HomeBookInfo>>> getPopularBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.popularBookList(
            currentPage: (Random().nextInt(70) + 1).toString());
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeBookInfo>>> getRecentBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.recentBookList(
            currentPage: (Random().nextInt(70) + 1).toString());
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeBookInfo>>>
      getMysteryAndDetectiveBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.mysteryAndDetectiveBookList(
            currentPage: (Random().nextInt(5) + 1).toString());
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeBookInfo>>> getRomanceBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.romanceBookList(
            currentPage: (Random().nextInt(3) + 1).toString());
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeBookInfo>>> getHorrorBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.horrorBookList(
            currentPage: (Random().nextInt(3) + 1).toString());
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeBookInfo>>>
      getActionAndAdventureBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.actionAndAdventureBookList(
            currentPage: (Random().nextInt(7) + 1).toString());
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeBookInfo>>> getShortStoriesBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.shortStoriesBookList(
            currentPage: (Random().nextInt(35) + 1).toString());
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeBookInfo>>>
      getScienceFictionBookList() async {
    if (!(await _networkInfo.isConnected)) {
      return Left(DataSourceExceptions.noInternetConnections.getFailure());
    } else {
      try {
        final response = await _homeServiceClient.scienceFictionBookList(
            currentPage: (Random().nextInt(22) + 1).toString());
        return Right(response.toDomain());
      } catch (e) {
        return Left(ExceptionHandler.handle(e).failure);
      }
    }
  }
}
