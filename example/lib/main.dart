// ignore_for_file: prefer_const_constructors

import 'package:d_method/d_method.dart';
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
              onPressed: () {
                DMethod.printBasic('Button CLicked');
              },
              child: Text('Print'),
            ),
            ElevatedButton(
              onPressed: () {
                double size = DMethod.byteToMb(10123456);
                DMethod.printTitle(
                  'byteToMb',
                  '${size.toStringAsFixed(2)} Mb',
                );
              },
              child: Text('Convert Byte to Mb'),
            ),
            ElevatedButton(
              onPressed: () {
                double range = DMethod.coordinateDistance(
                  -6.7595836,
                  107.6098743,
                  -6.7768781,
                  107.583941,
                );
                DMethod.printTitle(
                  'coordinateDistance',
                  '${range.toStringAsFixed(2)} km',
                );
              },
              child: Text('Get Range'),
            ),
          ],
        ),
      ),
    );
  }
}
