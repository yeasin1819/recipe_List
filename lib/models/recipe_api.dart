import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:recipe_list/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipeList() async {
    var url = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    Response response = await get(url, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': 'c4c054ae6bmshf597d7a2341b3ffp1f00b0jsn89c6a2c5ce76'
    });

    var jsonResponse = jsonDecode(response.body);
    List<Recipe> recipeList = [];

    if (response.statusCode == 200) {
      jsonResponse['feed'].map((data) {
        return recipeList.add(
          Recipe.fromJson(data['content']['details'])
        );
      }).toList();
    }

    return recipeList;
  }
}
