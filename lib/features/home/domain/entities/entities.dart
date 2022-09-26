import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Book {
  final String title;
  final String subtitle;
  final List<String> authors;
  final String description;
  final int pageCount;
  final List<String> categories;
  final int averageRating;
  final String thumbnail;

  Book({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.description,
    required this.pageCount,
    required this.categories,
    required this.averageRating,
    required this.thumbnail,
  });

  @override
  String toString() {
    return 'Book(title: $title, subtitle: $subtitle, authors: $authors, description: $description, pageCount: $pageCount, categories: $categories, averageRating: $averageRating, thumbnail: $thumbnail)';
  }

  Book copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    String? description,
    int? pageCount,
    List<String>? categories,
    int? averageRating,
    String? thumbnail,
  }) {
    return Book(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      description: description ?? this.description,
      pageCount: pageCount ?? this.pageCount,
      categories: categories ?? this.categories,
      averageRating: averageRating ?? this.averageRating,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.subtitle == subtitle &&
        listEquals(other.authors, authors) &&
        other.description == description &&
        other.pageCount == pageCount &&
        listEquals(other.categories, categories) &&
        other.averageRating == averageRating &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        authors.hashCode ^
        description.hashCode ^
        pageCount.hashCode ^
        categories.hashCode ^
        averageRating.hashCode ^
        thumbnail.hashCode;
  }
}

class HomeBookInfo extends Equatable {
  final int numberOfItems;
  final String imageLink;
  final String title;
  final String published;
  final String description;
  final List<String> author;
  const HomeBookInfo({
    required this.numberOfItems,
    required this.imageLink,
    required this.title,
    required this.published,
    required this.description,
    required this.author,
  });

  @override
  List<Object?> get props =>
      [numberOfItems, imageLink, title, published, description, author];
}
