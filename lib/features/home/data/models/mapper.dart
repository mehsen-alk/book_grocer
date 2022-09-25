import '../../domain/entities/entities.dart';
import 'responses.dart';

extension BookInfoResponseMapper on BookInfoResponse? {
  Book toDomain() {
    return Book(
        title: this?.title ?? '',
        subtitle: this?.subtitle ?? '',
        authors: this?.authors ?? [],
        description: this?.description ?? '',
        averageRating: this?.averageRating ?? 0,
        categories: this?.categories ??[],
        pageCount: this?.pageCount ?? 0,
        thumbnail: this?.imageLinks?.thumbnail ?? '');
  }
}

extension SearchResponseMapper on SearchResponse? {
  List<Book> toDomain() {
    List<Book> books = [];

    this?.items?.forEach((element) {
      books.add(element.bookInfo.toDomain());
    });

    return books;
  }
}
