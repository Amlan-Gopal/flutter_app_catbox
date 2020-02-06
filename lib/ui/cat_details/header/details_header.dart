import 'package:flutter/material.dart';
import 'package:flutter_app_catbox/models/cat.dart';

import 'cat_colored_image.dart';

class CatDetailHeader extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailHeader(
      this.cat,
  {@required this.avatarTag}
      );

  @override
  _CatDetailHeaderState createState() => _CatDetailHeaderState();
}

class _CatDetailHeaderState extends State<CatDetailHeader> {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var screenWidth = MediaQuery.of(context).size.width;

    var diagonalBackground = DiagonallyCutColoredImage(
      image: Image.asset(
          BACKGROUND_IMAGE,
      width: screenWidth,
      height: 280.0,
      fit: BoxFit.cover,  
      ),
      color: const Color(0xBB42A5F5),
    );

    var avatar = Hero(
      tag: widget.avatarTag,
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget.cat.avatarURL),
        radius: 75.0,
      ),
    );

    var likeInfo = Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.thumb_up,
            color: Colors.white,
            size: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              widget.cat.likeCounter.toString(),
              style: textTheme.subhead.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );

    var actionButtons = Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              minWidth: 140.0,
              color: theme.accentColor,
              textColor: Colors.white,
              onPressed: () async {

              },
              child: Text(
                'Adopt Me'
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: MaterialButton(
              minWidth: 140.0,
              color: Colors.lightGreen,
              textColor: Colors.white,
              onPressed: () async {

              },
              child: Text(
                  'Like'
              ),
            ),
          ),

        ],
      ),
    );
    
    return Stack(
      children: <Widget>[
        diagonalBackground,
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: Column(
            children: <Widget>[
              avatar,
              likeInfo,
              actionButtons
            ],
          ),
        ),
        Positioned(
          top: 30.0,
          left: 4.0,
          child: BackButton(color: Colors.white),
        )
      ],
    );
  }
}
