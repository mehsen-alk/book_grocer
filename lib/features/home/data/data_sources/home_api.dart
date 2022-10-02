import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/app/constants.dart';
import '../models/responses.dart';
part 'home_api.g.dart';
@RestApi(baseUrl:Constants.homeUrl)
abstract class HomeServiceClient{
  factory HomeServiceClient(Dio dio,{String baseUrl})=_HomeServiceClient;
  @GET('homepage.json')
  Future<BookResponse> bookListInfo();
}