import 'package:book_grocer/core/data/failure.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository{
  Future<Either<Failure,List<HomeBookInfo>>> getPopularBookList();
  Future<Either<Failure,List<HomeBookInfo>>> getRecentBookList();
  Future<Either<Failure,List<HomeBookInfo>>> getMysteryAndDetectiveBookList();
  Future<Either<Failure,List<HomeBookInfo>>> getRomanceBookList();
  Future<Either<Failure,List<HomeBookInfo>>> getHorrorBookList();
  Future<Either<Failure,List<HomeBookInfo>>> getActionAndAdventureBookList();
  Future<Either<Failure,List<HomeBookInfo>>> getShortStoriesBookList();
  Future<Either<Failure,List<HomeBookInfo>>> getScienceFictionBookList();
}