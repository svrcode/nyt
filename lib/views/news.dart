import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    getNewsNYT();
    super.initState();
  }

  var jsonNews;

  Future<void> getNewsNYT() async {
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
            child: const Text('NYT'),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Flexible(
                                flex: 1,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/logo_nyt.png'),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Flexible(
                                flex: 3,
                                child: Text(
                                  jsonNews[index]['title'],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            jsonNews[index]['abstract'],
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Flexible(
                                flex: 1,
                                child: Text(
                                  'Author: ',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Flexible(
                                flex: 3,
                                child: Text(
                                  jsonNews[index]['byline'],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
