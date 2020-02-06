import 'package:flutter/material.dart';
import 'package:flutter_app_catbox/models/cat.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final dynamic cattributeLookup = {
  "children": {"name": "kid friendly", "icon": FontAwesomeIcons.child},
  "desexed": {"name": "Desexed", "icon": FontAwesomeIcons.cut},
  "vaccinated": {"name": "Vaccinated", "icon": FontAwesomeIcons.eyeDropper},
  "microchipped": {"name": "Microchipped", "icon": FontAwesomeIcons.microchip},
};

class CattributesShowCase extends StatelessWidget {
  final Cat cat;

  CattributesShowCase({this.cat});

  Widget _createCircleBadge(IconData iconData, Color bgColor, Color iconColor, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: bgColor,
            child: Icon(
              iconData,
              color: iconColor,
              size: 36.0,
            ),
            radius: 36.0,
          ),
          Positioned(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: iconColor
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   var items = <Widget>[];

   for(int i = 0; i< cat.cattributes.length; i++){
     var badge = _createCircleBadge(
       cattributeLookup[cat.cattributes[i]]['icon'],
       Colors.white12,
       Colors.white,
       cattributeLookup[cat.cattributes[i]]['name']
     );
     items.add(badge);
   }

   var delegate = SliverGridDelegateWithFixedCrossAxisCount(
     crossAxisCount: 4,
     crossAxisSpacing: 8.0,
     mainAxisSpacing: 8.0,
   );

   return GridView(
     padding: const EdgeInsets.only(top: 16),
     gridDelegate: delegate,
     children: items,
   );
  }

}

