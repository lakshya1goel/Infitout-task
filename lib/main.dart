import 'package:assignment/table_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Scrollable Table')),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TablePage(),
        ),
      ),
    );
  }
}
