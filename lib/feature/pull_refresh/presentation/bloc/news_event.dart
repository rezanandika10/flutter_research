import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNews extends NewsEvent {

  @override
  List<Object> get props => [];
}
