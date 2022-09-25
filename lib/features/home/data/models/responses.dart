import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "Status")
  int? status;
  @JsonKey(name: "message")
  String? message;


}

@JsonSerializable()
class SearchResponse extends BaseResponse {
  @JsonKey(name: 'totalItems')
  int? totalItems;

  @JsonKey(name: 'items')
  List<BookItemResponse>? items;

  SearchResponse({
    this.totalItems,
    this.items,
  });

  // from json
  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class BookItemResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'volumeInfo')
  BookInfoResponse? bookInfo;

  BookItemResponse({
    this.id,
    this.bookInfo,
  });

  // from json
  factory BookItemResponse.fromJson(Map<String, dynamic> json) =>
      _$BookItemResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$BookItemResponseToJson(this);
}

@JsonSerializable()
class BookInfoResponse {
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'subtitle')
  String? subtitle;

  @JsonKey(name: 'authors')
  List<String>? authors;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'pageCount')
  int? pageCount;

  @JsonKey(name: 'categories')
  List<String>? categories;

  @JsonKey(name: 'averageRating')
  int? averageRating;

  @JsonKey(name: 'imageLinks')
  ImageLinksResponse? imageLinks;

  BookInfoResponse({
    this.title,
    this.subtitle,
    this.authors,
    this.description,
    this.pageCount,
    this.categories,
    this.averageRating,
    this.imageLinks,
  });

  // from json
  factory BookInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$BookInfoResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$BookInfoResponseToJson(this);
}

@JsonSerializable()
class ImageLinksResponse {

  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  ImageLinksResponse({
    this.thumbnail,
  });

  // from json
  factory ImageLinksResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ImageLinksResponseToJson(this);
}
