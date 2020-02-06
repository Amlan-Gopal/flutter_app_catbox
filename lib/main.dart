import 'package:flutter/material.dart';
import 'package:flutter_app_catbox/ui/cat_list.dart';

void main() async => runApp(CatBoxApp());

class CatBoxApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Adopter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pinkAccent,
        fontFamily: 'Ubuntu'
      ),
      home: CatList(),
    );
  }
}
