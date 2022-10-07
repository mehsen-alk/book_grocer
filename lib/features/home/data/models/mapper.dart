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
    List<HomeBookInfo> book = [];
    this?.bookListInfoResponses?.forEach((element) {
      HomeBookInfo homeBookInfo = HomeBookInfo(
        imageLink: element.bookImage?.first.imageLink ?? "",
        bookTitle: element.metadata?.title ?? "",
        published: element.metadata?.published ?? "",
        description: element.metadata?.description ?? "",
        author: element.metadata?.bookAuthorResponse.toDomain() ?? [],
        jsonTitle: this?.jsonMetadata?.jsonTitle.toDomain() ?? "",
      );
      book.add(homeBookInfo);
    });
    return book;
  }
}

extension BookAuthors on List<BookAuthorResponse>? {
  List<String> toDomain() {
    List<String> author = [];
    this?.forEach((element) {
      author.add(element.authorName ?? "");
    });
    return author;
  }
}

extension JsonMetadateExtension on String? {
  String toDomain() {
    switch (this) {
      case "Most popular: Mystery & detective":
        {
          return "Mystery & detective";
        }

      case "Most popular: Romance":
        {
          return "Romance";
        }

      case "Most popular: Horror":
        {
          return "Horror";
        }

      case "Most popular: Action & adventure":
        {
          return "Action & adventure";
        }

      case "Most popular: Short stories":
        {
          return "Short stories";
        }
      case "Most popular: Science fiction":
        {
          return "Science fiction";
        }
      case "Most popular":
        {
          return "Popular";
        }
      case "New releases":
        {
          return "Recently viewed";
        }

      default:
        {
          return "";
        }
    }
  }
}
