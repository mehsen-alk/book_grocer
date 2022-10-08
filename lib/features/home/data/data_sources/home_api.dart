import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/app/constants.dart';
import '../models/responses.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: Constants.homeUrl)
abstract class HomeServiceClient {
  factory HomeServiceClient(Dio dio, {String baseUrl}) = _HomeServiceClient;

  @GET('top.json?')
  Future<BookResponse> popularBookList(
      {@Query("page") required String currentPage});

  @GET('recent.json?')
  Future<BookResponse> recentBookList(
      {@Query("page") required String currentPage});

  @GET('top.json?cat=FBFIC022000&')
  Future<BookResponse> mysteryAndDetectiveBookList(
      {@Query("page") required String currentPage});

  @GET('top.json?cat=FBFIC027000&')
  Future<BookResponse> romanceBookList(
      {@Query("page") required String currentPage});

  @GET('top.json?cat=FBFIC015000&')
  Future<BookResponse> horrorBookList(
      {@Query("page") required String currentPage});

  @GET('top.json?cat=FBFIC002000&')
  Future<BookResponse> actionAndAdventureBookList(
      {@Query("page") required String currentPage});

  @GET('top.json?cat=FBFIC029000&')
  Future<BookResponse> shortStoriesBookList(
      {@Query("page") required String currentPage});

  @GET('top.json?cat=FBFIC028000&')
  Future<BookResponse> scienceFictionBookList(
      {@Query("page") required String currentPage});
}
