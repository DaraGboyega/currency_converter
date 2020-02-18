import 'dart:convert';
import 'package:flutter/material.dart';
import 'ConverterPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return cConverter();
  }
}

class cConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'OpenSans',primarySwatch: Colors.green ,hintColor: Colors.green[800], cursorColor: Colors.green[800]),
      debugShowCheckedModeBanner: false,
      home: ConverterPage(),
    );
  }
}


