import 'package:flutter/material.dart';
import 'package:flutter_app_catbox/models/cat.dart';

class CatDetailBody extends StatefulWidget {
  final Cat cat;

  CatDetailBody(this.cat);

  @override
  _CatDetailBodyState createState() => _CatDetailBodyState();
}

class _CatDetailBodyState extends State<CatDetailBody> {

  Widget _createCircleBadge(IconData iconData, Color color){
       return Padding(
         padding: const EdgeInsets.only(left: 8.0),
         child: CircleAvatar(
           backgroundColor: color,
           radius: 16.0,
           child: Icon(
             iconData,
             color: Colors.white,
             size: 16.0,
           ),
         ),
       );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    var location = Row(
      children: <Widget>[
        Icon(
          Icons.place,
          color: Colors.white,
          size: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            widget.cat.location,
            style: textTheme.subhead.copyWith(color: Colors.white),
          ),
        )
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.cat.name,
          style: textTheme.headline.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: location,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            widget.cat.description,
            style: textTheme.body1.copyWith(color: Colors.white70, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: <Widget>[
              _createCircleBadge(Icons.share, theme.accentColor),
              _createCircleBadge(Icons.call, Colors.white30),
              _createCircleBadge(Icons.email, Colors.white12)
            ],
          ),
        )
      ],
    );
  }
}
