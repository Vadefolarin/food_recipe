import 'package:flutter/material.dart';
import 'package:food_recipe/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      title: 'Food Recipe',
      theme: ThemeData(
        primaryColor: Colors.white,
       primarySwatch: Colors.blue,
       textTheme: TextTheme(
         bodyText2: TextStyle(color: Colors.white) 
       )
      ),
      home: HomePage(),
    );
  }
}
