import 'package:day1_coba_flutter/core/resources/data_state.dart';
import 'package:day1_coba_flutter/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {

  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
