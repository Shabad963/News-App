import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/application/news/news_bloc.dart';
import 'package:news_app/domain/models/news.dart';
import 'package:news_app/presentation/article_page.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewsBloc>(context).add(const NewsEvent.getNews());
    });
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.news.isEmpty) {
          const Center(
            child: Text('No Internet available'),
          );
        }
        return ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              final articles = state.news[index];
              final _date = DateTime.parse(articles.publishedAt!);
              final formattedDate = DateFormat('yyyy-MM-dd').format(_date);
              return GestureDetector(
                onTap: () {
                  navigateToArticleDetailPage(context, articles);
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  semanticContainer: true,
                  elevation: 10,
                  shadowColor: Colors.black,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black54,
                              Colors.black
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, 0.2, 0.8, 1],
                          ),
                        ),
                        child: Image.network(
                          articles.urlToImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              articles.title!,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  articles.author!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}

void navigateToArticleDetailPage(BuildContext context, News article) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ArticlePage(
      article: article,
    );
  }));
}
