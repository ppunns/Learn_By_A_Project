import 'dart:io';
import 'package:dio/dio.dart';
import 'package:day1_coba_flutter/core/resources/data_state.dart';
import 'package:day1_coba_flutter/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:day1_coba_flutter/features/daily_news/data/models/article.dart';
import 'package:day1_coba_flutter/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/constans/constans.dart';

class ArticlesRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;
  ArticlesRepositoryImpl(this._newsApiService);


  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final HttpResponse = await _newsApiService.getNewsArticles(
          NewsApiKey,
          countryQuery,
          categoryQuery,
        );
        print('API Response status: ${HttpResponse.response.statusCode}');
    print('API Response data: ${HttpResponse.data}');
      if(HttpResponse.response.statusCode == HttpStatus.ok){
        return DataSuccess(HttpResponse.data);
      }else{
        return DataFailed(
          DioError(
            requestOptions: HttpResponse.response.requestOptions,
            response: HttpResponse.response,
            type: DioExceptionType.badResponse,
            error: HttpResponse.response.statusMessage,
          )
        );
      }
    } on DioError catch (e){
      print('API Error: ${e.message}');
      return DataFailed(e);
    }
  }
}


