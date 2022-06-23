import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/domain/models/news.dart';

class ArticlePage extends StatelessWidget {
  final News article;
  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _date = DateTime.parse(article.publishedAt!);
    final formattedDate = DateFormat('yyyy-MM-dd').format(_date);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black87,
                  Colors.black
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.2, 0.8, 1],
              ),
            ),
            child: Image.network(article.urlToImage!, fit: BoxFit.cover),
          ),
          Positioned(
            top: 75,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 30,
                child: Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  article.title!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(article.author!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                    Text(formattedDate,
                        style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(article.description!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
