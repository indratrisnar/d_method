// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('DView')),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(''),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(''),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(''),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
