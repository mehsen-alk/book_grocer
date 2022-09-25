// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['Status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'message': instance.message,
    };

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
      averageRating: json['averageRating'] as int?,
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
