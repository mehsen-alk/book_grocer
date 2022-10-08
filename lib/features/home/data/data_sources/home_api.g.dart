// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _HomeServiceClient implements HomeServiceClient {
  _HomeServiceClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://catalog.feedbooks.com/publicdomain/browse/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BookResponse> popularBookList({required currentPage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': currentPage};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.json?',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookResponse> recentBookList({required currentPage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': currentPage};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'recent.json?',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookResponse> mysteryAndDetectiveBookList(
      {required currentPage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': currentPage};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.json?cat=FBFIC022000&',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookResponse> romanceBookList({required currentPage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': currentPage};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.json?cat=FBFIC027000&',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookResponse> horrorBookList({required currentPage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': currentPage};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.json?cat=FBFIC015000&',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookResponse> actionAndAdventureBookList(
      {required currentPage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': currentPage};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.json?cat=FBFIC002000&',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookResponse> shortStoriesBookList({required currentPage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': currentPage};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.json?cat=FBFIC029000&',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookResponse> scienceFictionBookList({required currentPage}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': currentPage};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BookResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'top.json?cat=FBFIC028000&',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
