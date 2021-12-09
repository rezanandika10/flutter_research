import 'package:equatable/equatable.dart';
import 'package:flutter_research/feature/pull_refresh/model/news_model.dart';


abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}


class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  const NewsLoaded({this.newsModel});
  final NewsModel newsModel;

  @override
  List<Object> get props => [newsModel];
}

class NewsError extends NewsState {
  const NewsError(this.error) : assert(error != null);
  final String error;

  @override
  List<Object> get props => [error];
}
