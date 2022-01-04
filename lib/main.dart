import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:recipe_list/models/recipe.dart';
import 'package:recipe_list/models/recipe_api.dart';
import 'package:recipe_list/widgets/recipe_card.dart';

int main() {
  runApp(MyApp());
  return 0;
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipe List",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Recipe List"),
          centerTitle: true,
        ),
         drawer: Drawer(
        backgroundColor: Colors.green[100],
        elevation: 6,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.greenAccent, Colors.lightGreen])),
                accountName: Text(
                  "Yeasin Arafat",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  "abc@gmail.com",
                  style: TextStyle(color: Colors.black),
                )),
            ListTile(
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.black,
              ),
              title: Text(
                "Menu",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {},
            ),
          ],
        )),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecipeApi.getRecipeList(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
             // return Text(snapshot.data[index].name);
              return RecipeCard(
                  snapshot.data[index].name,
                  snapshot.data[index].totalTime,
                  snapshot.data[index].rating,
                  snapshot.data[index].images);
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
