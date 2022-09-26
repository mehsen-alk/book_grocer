import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/app/constants.dart';
import '../models/responses.dart';

part 'search_api.g.dart';

const String searchApiKey = '';

@RestApi(baseUrl: Constants.searchUrl)
abstract class SearchServiceClient {
  factory SearchServiceClient(Dio dio, {String baseUrl}) = _SearchServiceClient;

  @GET('volumes?')
  Future<SearchResponse> searchForBook(
      { @Query("q") required String bookName,
      @Query("key") String apiKey = searchApiKey});
}

