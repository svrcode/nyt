import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  // @override
  // void initState() {
  //   getNewsNYT();
  //   super.initState();
  // }

  var jsonNews;

  getNewsNYT() async {
    var dio = Dio();
    final response = await dio.get(
        'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=0SDaGP4DLAzR5OtGxVC6ObfhNljic18h');
    final jsonBody = response.data['results'];

    setState(() {
      jsonNews = jsonBody;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
        actions: [
          ElevatedButton(
            onPressed: getNewsNYT,
            child: const Text('NYT 1'),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jsonNews[index]['title'],
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      jsonNews[index]['abstract'],
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('More: '),
                        const SizedBox(height: 5),
                        Text(
                          jsonNews[index]['url'],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: jsonNews == null ? 0 : jsonNews.length,
      ),
    );
  }
}
