import 'package:book_grocer/core/data/failure.dart';
import 'package:book_grocer/features/home/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository{
  Future<Either<Failure,List<HomeBookInfo>>> getBookList();
}