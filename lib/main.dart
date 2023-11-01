import 'package:flutter/material.dart';
import 'package:get_api_with_dio/get_api_with_dio2.dart';

import 'get_api_with_dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: GetApiWithDio(),
      home: MyHomePage(),
    );
  }
}
