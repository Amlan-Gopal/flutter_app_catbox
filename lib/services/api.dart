import 'dart:convert';
import 'package:flutter_app_catbox/models/cat.dart';

class CatApi{
  static List<Cat> allCatsFromJson(String jsonData){
    List<Cat> cats = [];
    json.decode(jsonData)['cats'].forEach((cat) => cats.add(_forMap(cat)));
    return cats;
  }
  static Cat _forMap(Map<String, dynamic> map){
     return Cat(
       externalId: map['id'],
       name: map['name'],
       description: map['description'],
       avatarURL: map['image_url'],
       likeCounter: map['like_counter'],
       location: map['location'],
       isAdopted: map['adopted'],
       cattributes: List<String>.from(map['cattributes']),
       pictures: List<String>.from(map['pictures']),
     );
  }
}