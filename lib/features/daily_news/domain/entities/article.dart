import 'dart:ffi';

import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final Int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publisheadAt;
  final String? content;

  const ArticleEntity({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publisheadAt,
    this.content,
  });

  @override
  List<Object?> get props => [
    id,
    author,
    title,
    description,
    url,
    urlToImage,
    publisheadAt,
    content,
  ];
}
