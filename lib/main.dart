import 'package:flutter/material.dart';

void main() {
  runApp(const LabApp());
}

class LabApp extends StatelessWidget {
  const LabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Лабораторная работа №1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          toolbarHeight: 96,
          title: const Text(
            'Мангушев Раиль Рашидович\nПИбд-31',
            style: TextStyle(fontSize: 18),
            softWrap: true,
          ),
        ),
        body: const Center(
          child: Text('Лабораторная работа №1'),
        ),
      ),
    );
  }
}
