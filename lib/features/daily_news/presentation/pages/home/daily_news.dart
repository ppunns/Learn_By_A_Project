import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../bloc/article/remote/remote_article_bloc.dart';
import '../../bloc/article/remote/remote_article_state.dart';
import '../../widgets/articles_widgets.dart';
class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar() ,
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
    );
  }
  _buildBody(){
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_,state){
        if(state is RemoteArticleLoading){
          return const Center(child: CircularProgressIndicator());
        }
        if(state is RemoteArticlesError){
          return const Center(child: Icon(Icons.refresh));
        }
        if(state is RemoteArticlesDone){
          return ListView.builder(
            itemBuilder: (context, index){
              return ArticleWidget(article: state.articles![index]);
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox.shrink();
      }
    );
  }
}