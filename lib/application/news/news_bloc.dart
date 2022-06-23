import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/core/failures/main_failure.dart';
import 'package:news_app/domain/i_news_repo.dart';
import 'package:news_app/domain/models/news.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final INewsRepo _newsRepo;
  NewsBloc(this._newsRepo) : super(NewsState.initial()) {
    on<_GetNews>((event, emit) async {
      emit(state.copyWith(isLoading: true, newsFailureOrSuccessOption: none()));
      final Either<MainFailure, List<News>> newsOption =
          await _newsRepo.getNews();
      log(newsOption.toString());
      emit(newsOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              newsFailureOrSuccessOption: Some(Left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              news: success,
              newsFailureOrSuccessOption: Some(Right(success)))));
    });
  }
}
