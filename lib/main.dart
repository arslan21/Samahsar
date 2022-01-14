import 'package:flutter/material.dart';
import 'package:smah/pages/home.dart';
import 'package:smah/pages/word_list.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/home': (context) => MyHomePage(),
      WordList.routeName: (context) => WordList(),
    },
  )
);