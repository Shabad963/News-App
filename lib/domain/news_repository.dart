import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/strings.dart';
import 'package:news_app/domain/i_news_repo.dart';
import 'package:news_app/domain/models/news.dart';

@LazySingleton(as: INewsRepo)
class NewsRepository implements INewsRepo {
  @override
  Future<Either<MainFailure, List<News>>> getNews() async {
    try {
      final Response response = await Dio(BaseOptions()).get(ApiEndPoints.news);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final newsList = (response.data['articles'] as List).map((e) {
          return News.fromJson(e);
        }).toList();

        print(newsList);
        return Right(newsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
