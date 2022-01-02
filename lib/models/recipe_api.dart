import 'dart:convert';

import 'package:http/http.dart' as http;

import './recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers:{
      'x-rapidapi-key': 'c4c054ae6bmshf597d7a2341b3ffp1f00b0jsn89c6a2c5ce76',
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    var data = jsonDecode(response.body);
    var _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
