import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_research/feature/pull_refresh/data/repo/news_repo.dart';
import 'package:flutter_research/feature/pull_refresh/model/news_model.dart';
import 'bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({@required this.newsRepo})
      : assert(newsRepo != null),
        super(NewsInitial());

  final NewsRepo newsRepo;
  NewsModel newsModel;

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      try {
        newsModel = await newsRepo.getNews();
        if (newsModel.articles != null) {
          yield NewsLoaded(newsModel: newsModel);
        } else {
          yield NewsError('no_data');
        }
      } catch (e) {
        yield NewsError(e.toString());
      }
    }
  }
}
