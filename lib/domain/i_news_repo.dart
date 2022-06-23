import 'package:dartz/dartz.dart';
import 'package:news_app/core/failures/main_failure.dart';
import 'package:news_app/domain/models/news.dart';

abstract class INewsRepo {
  Future<Either<MainFailure, List<News>>> getNews();
}
