import 'dart:convert';
import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {'start': '0', 'limit': '18', 'tag': 'list.recipe.popular'});
    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "e4f7ce8290msh9795393164620f1p14bb89jsndc3ebcf6220b",
      "useQueryString": 'true',
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipeFromSnapshot(_temp);
  }
}