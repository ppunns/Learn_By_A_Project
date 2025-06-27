

import 'package:day1_coba_flutter/features/daily_news/data/models/article.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constans/constans.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: NewsApiBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String? baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles(
    @Query('apiKey') String apiKey,
    @Query('country') String country,
    @Query('category') String category,
  );
}
