import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FPMI Flutter Music Band',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: const SafeArea(
          child: Center(
            child: Text(
              'Home Page',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
