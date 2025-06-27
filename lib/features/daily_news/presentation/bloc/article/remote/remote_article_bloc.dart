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
    
    if(state is DataSuccess && state.data!.isNotEmpty){
      emit(RemoteArticlesDone(articles: state.data));
    }
    if(state is DataFailed){
      emit(RemoteArticlesError(error: state.error));
    }
  }
}