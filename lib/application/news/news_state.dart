part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    required bool isLoading,
    required List<News> news,
    required Option<Either<MainFailure, List<News>>> newsFailureOrSuccessOption,
  }) = _NewsState;

  factory NewsState.initial() {
    return const NewsState(
        isLoading: false, newsFailureOrSuccessOption: None(), news: []);
  }
}
