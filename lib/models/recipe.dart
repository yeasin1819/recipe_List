import 'package:flutter/cupertino.dart';

class Recipe {
  final String name;
  final String images;
  final String rating;
  final String totalTime;

  Recipe(this.name, this.images, this.rating, this.totalTime);

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      json["name"],
      json["images"][0]['hostedLargeUrl'],
      json['rating'].toString(),
      json['totalTime']
      );
  }

}
