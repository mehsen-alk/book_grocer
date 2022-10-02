import '../../domain/entities/entities.dart';
import 'responses.dart';

extension BookInfoResponseMapper on BookInfoResponse? {
  Book toDomain() {
    return Book(
        title: this?.title ?? '',
        subtitle: this?.subtitle ?? '',
        authors: this?.authors ?? ['unknown'],
        description: this?.description ?? '',
        averageRating: this?.averageRating ?? 0,
        categories: this?.categories ?? [],
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

extension BookResponseMapper on BookResponse? {
  List<HomeBookInfo> toDomain() {
    List<HomeBookInfo> books = [];

    this?.bookListInfoResponses?.forEach((element) {
      HomeBookInfo homeBookInfo = HomeBookInfo(
          imageLink: element.bookImage?.first.imageLink ?? '',
          title: element.metadata?.title ?? '',
          published: element.metadata?.published ?? '',
          description: element.metadata?.description ?? '',
          author: element.metadata?.bookAuthorResponse.toDomain() ?? []);

      books.add(homeBookInfo);
    });

    return books;
  }
}

extension BookAuthors on List<BookAuthorResponse>? {
  List<String> toDomain() {
    List<String> authors = [];

    this?.forEach((element) {
      authors.add(element.authorName ?? '');
    });

    return authors;
  }
}
