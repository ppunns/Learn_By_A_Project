import 'package:day1_coba_flutter/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:day1_coba_flutter/features/daily_news/data/repository/articles_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:day1_coba_flutter/features/daily_news/domain/repository/article_repository.dart';
import 'package:day1_coba_flutter/features/daily_news/domain/usecase/get_articles.dart';
import 'package:day1_coba_flutter/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());
  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticlesRepositoryImpl(sl()));
  //UseCase
  sl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(sl()));
  //Bloc
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}