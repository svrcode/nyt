import 'package:flutter/material.dart';

import '../views/hello.dart';
import '../views/news.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Promo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/hello': (context) => const HelloView(),
        '/news': (context) => const NewsView(),
      },
      initialRoute: '/hello',
    );
  }
}
