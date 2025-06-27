import 'package:day1_coba_flutter/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:day1_coba_flutter/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day1_coba_flutter/features/daily_news/domain/usecase/get_articles.dart';
import 'package:day1_coba_flutter/core/resources/data_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState>{

  final GetArticlesUseCase _getArticlesUseCase;
  RemoteArticleBloc(this._getArticlesUseCase) : super( const RemoteArticleLoading()){
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit)async{
    final state = await _getArticlesUseCase(null);
    print('Bloc received state: $state');
    if(state is DataSuccess && state.data!.isNotEmpty){
      print('Bloc: DataSuccess, articles count: ${state.data!.length}');
      emit(RemoteArticlesDone(articles: state.data));
    }
    if(state is DataFailed){
      print('Bloc: DataFailed, error: ${state.error}');
      emit(RemoteArticlesError(error: state.error));
    }
  }
}