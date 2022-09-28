import 'package:flutter/material.dart';
import 'package:flutter_provider_project/test_one.dart';
import 'package:provider/provider.dart';

import 'card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return Cart();
    } ,child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const TestOne(),
    ),);
  }
}

