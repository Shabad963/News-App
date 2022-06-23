import 'package:flutter/material.dart';

import 'package:news_app/presentation/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'HEADLINES',
          style: TextStyle(letterSpacing: 5),
        ),
      ),
      body: HomeCard(),
    );
  }
}
