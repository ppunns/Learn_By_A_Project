import 'package:day1_coba_flutter/core/usecase/usecase.dart';
import 'package:day1_coba_flutter/core/resources/data_state.dart';
import 'package:day1_coba_flutter/features/daily_news/data/models/article.dart';
import 'package:day1_coba_flutter/features/daily_news/domain/entities/article.dart';
import 'package:day1_coba_flutter/features/daily_news/domain/repository/article_repository.dart';

class GetArticlesUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {

  final ArticleRepository _articleRepository;

  GetArticlesUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call(void params) {
    return _articleRepository.getNewsArticles();
  }
  
}