import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_recipe/models/recipe.dart';
import 'package:food_recipe/models/recipeApi.dart';
import 'package:food_recipe/views/widgets/recipe_card.dart';

import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe>? _recipe;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<Void> getRecipes() async {
    _recipe = await RecipeApi.getRecipe();

    setState(() {
      isLoading = false;
    });
    // print(_recipe);
    return getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(child: DrawereWidget(),padding: EdgeInsets.only(right: 85),),
        appBar: AppBar(
          //  centerTitle: true,

          leading: Icon(Icons.menu),
          title: Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text(
                "Food Recipe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipe!.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipe![index].name,
                      cookTime: _recipe![index].totalTime,
                      rating: _recipe![index].rating.toString(),
                      thumbnailUrl: _recipe![index].images);
                })

        // RecipeCard(
        //   cookTime: "30 mins",
        //   rating: "3",
        //   title: "Fried Rice",
        //   thumbnailUrl:
        //       "https://images.unsplash.com/photo-1603133872878-684f208fb84b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=625&q=80",
        // ),

        );
  }
}
