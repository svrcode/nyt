import 'package:flutter/material.dart';

class HelloView extends StatelessWidget {
  const HelloView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  height: 120,
                  image: AssetImage('assets/images/logo_nyt.png'),
                ),
                const SizedBox(height: 15),
                const Text(
                  'New York Times: top news',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/news');
                    },
                    child: const Text('Watch news'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
