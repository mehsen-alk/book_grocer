// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Book {
  final String title;
  final String subtitle;
  final List<String> authors;
  final String description;
  final int pageCount;
  final List<String> categories;
  final double averageRating;
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

  

  Book copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    String? description,
    int? pageCount,
    List<String>? categories,
    double? averageRating,
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
  String toString() {
    return 'Book(title: $title, subtitle: $subtitle, authors: $authors, description: $description, pageCount: $pageCount, categories: $categories, averageRating: $averageRating, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
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
  final String imageLink;
  final String bookTitle;
  final String published;
  final String description;
  final List<String> author;
  final List<String> subject;
  final String jsonTitle;
  const HomeBookInfo({
    required this.imageLink,
    required this.bookTitle,
    required this.published,
    required this.description,
    required this.author,
    required this.jsonTitle,
    required this.subject
  });

  @override
  List<Object?> get props =>
      [imageLink, bookTitle, published, description, author,jsonTitle,subject];
}
