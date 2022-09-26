import 'package:dartz/dartz.dart';

import '../../../../core/data/failure.dart';
import '../../data/models/requests.dart';
import '../entities/entities.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Book>>> searchForBook(
      SearchFooBookRequest searchFooBookRequest);
}
