import 'package:flutter/material.dart';
import 'package:flutter_app_catbox/models/cat.dart';

class DetailsShowCase extends StatelessWidget {
  final Cat cat;

  DetailsShowCase({this.cat});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Center(
      child: Text(
          cat.description,
          textAlign: TextAlign.center,
        style: textTheme.body1.copyWith(color: Colors.white),
      ),
    );
  }
}

