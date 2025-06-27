import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:day1_coba_flutter/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticleLoading extends RemoteArticleState{
  const RemoteArticleLoading();
}
class RemoteArticlesDone extends RemoteArticleState{
  const RemoteArticlesDone({List<ArticleEntity>? articles}) : super(articles: articles);
}
class RemoteArticlesError extends RemoteArticleState{
  const RemoteArticlesError({DioError? error}) : super(error: error);
}
