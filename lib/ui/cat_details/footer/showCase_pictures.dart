import 'package:flutter/material.dart';
import 'package:flutter_app_catbox/models/cat.dart';

class PicturesShowCase extends StatelessWidget {
  final Cat cat;

  PicturesShowCase({this.cat});

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];

    for(int i = 0; i< cat.pictures.length; i++){
      var image = Image.network(
        cat.pictures[i],
        width: 200.0,
        height: 200.0,
      );
      items.add(image);
    }

    var delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return GridView(
      padding: EdgeInsets.only(top: 16),
      gridDelegate: delegate,
      children: items,
    );
  }
}

