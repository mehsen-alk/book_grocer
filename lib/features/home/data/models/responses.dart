import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "Status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

/// Search
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

/// Home
@JsonSerializable()
class BookResponse extends BaseResponse {
  @JsonKey(name: "publications")
  List<BookListInfoResponses>? bookListInfoResponses;
  BookResponse({this.bookListInfoResponses});
  // from json
  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BookResponseToJson(this);
}


@JsonSerializable()
class BookListInfoResponses {
  @JsonKey(name: "metadata")
  BookMetadataResponse? metadata;
  @JsonKey(name: "images")
  List<BookImageResponse>? bookImage;
  BookListInfoResponses({
    this.metadata,
    this.bookImage,
  });
  // from json
  factory BookListInfoResponses.fromJson(Map<String, dynamic> json) =>
      _$BookListInfoResponsesFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BookListInfoResponsesToJson(this);
}

@JsonSerializable()
class BookImageResponse {
  @JsonKey(name: "href")
  String? imageLink;
  BookImageResponse({
    this.imageLink,
  });
  // from json
  factory BookImageResponse.fromJson(Map<String, dynamic> json) =>
      _$BookImageResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BookImageResponseToJson(this);
}

@JsonSerializable()
class BookMetadataResponse {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "published")
  String? published;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "author")
  List<BookAuthorResponse>? bookAuthorResponse;
  BookMetadataResponse({
    this.title,
    this.published,
    this.description,
    this.bookAuthorResponse,
  });
  // from json
  factory BookMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$BookMetadataResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BookMetadataResponseToJson(this);
}

@JsonSerializable()
class BookAuthorResponse {
  @JsonKey(name: "name")
  String? authorName;
  BookAuthorResponse({
    this.authorName,
  });
  // from json
  factory BookAuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$BookAuthorResponseFromJson(json);
  // to json
  Map<String, dynamic> toJson() => _$BookAuthorResponseToJson(this);
}
