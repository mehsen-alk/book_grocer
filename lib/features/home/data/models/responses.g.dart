// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      totalItems: json['totalItems'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => BookItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['Status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'message': instance.message,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

BookItemResponse _$BookItemResponseFromJson(Map<String, dynamic> json) =>
    BookItemResponse(
      id: json['id'] as String?,
      bookInfo: json['volumeInfo'] == null
          ? null
          : BookInfoResponse.fromJson(
              json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookItemResponseToJson(BookItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'volumeInfo': instance.bookInfo,
    };

BookInfoResponse _$BookInfoResponseFromJson(Map<String, dynamic> json) =>
    BookInfoResponse(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      pageCount: json['pageCount'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinksResponse.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookInfoResponseToJson(BookInfoResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'description': instance.description,
      'pageCount': instance.pageCount,
      'categories': instance.categories,
      'averageRating': instance.averageRating,
      'imageLinks': instance.imageLinks,
    };

ImageLinksResponse _$ImageLinksResponseFromJson(Map<String, dynamic> json) =>
    ImageLinksResponse(
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ImageLinksResponseToJson(ImageLinksResponse instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
    };

BookResponse _$BookResponseFromJson(Map<String, dynamic> json) => BookResponse(
      bookListInfoResponses: (json['publications'] as List<dynamic>?)
          ?.map(
              (e) => BookListInfoResponses.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['Status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BookResponseToJson(BookResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'message': instance.message,
      'publications': instance.bookListInfoResponses,
    };

BookListInfoResponses _$BookListInfoResponsesFromJson(
        Map<String, dynamic> json) =>
    BookListInfoResponses(
      metadata: json['metadata'] == null
          ? null
          : BookMetadataResponse.fromJson(
              json['metadata'] as Map<String, dynamic>),
      bookImage: (json['images'] as List<dynamic>?)
          ?.map((e) => BookImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookListInfoResponsesToJson(
        BookListInfoResponses instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'images': instance.bookImage,
    };

BookImageResponse _$BookImageResponseFromJson(Map<String, dynamic> json) =>
    BookImageResponse(
      imageLink: json['href'] as String?,
    );

Map<String, dynamic> _$BookImageResponseToJson(BookImageResponse instance) =>
    <String, dynamic>{
      'href': instance.imageLink,
    };

BookMetadataResponse _$BookMetadataResponseFromJson(
        Map<String, dynamic> json) =>
    BookMetadataResponse(
      title: json['title'] as String?,
      published: json['published'] as String?,
      description: json['description'] as String?,
      bookAuthorResponse: (json['author'] as List<dynamic>?)
          ?.map((e) => BookAuthorResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookMetadataResponseToJson(
        BookMetadataResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'published': instance.published,
      'description': instance.description,
      'author': instance.bookAuthorResponse,
    };

BookAuthorResponse _$BookAuthorResponseFromJson(Map<String, dynamic> json) =>
    BookAuthorResponse(
      authorName: json['name'] as String?,
    );

Map<String, dynamic> _$BookAuthorResponseToJson(BookAuthorResponse instance) =>
    <String, dynamic>{
      'name': instance.authorName,
    };
