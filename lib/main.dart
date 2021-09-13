import 'package:flutter/material.dart';
import 'package:food_recipe/views/home.dart';
import 'package:food_recipe/views/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => Splashscreen(),
        "/HomePage": (content) => HomePage(),
      },
      title: 'Food Recipe',
      theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),

          //Since we used "/" in Initial route, we shouldnt specify a home
     // home: HomePage(),
    );
  }
}
