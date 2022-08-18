import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        // color of the app
        primarySwatch: Colors.green,

        // color of app background
        canvasColor: Colors.black,

        iconTheme: IconThemeData(color: Colors.white,size: 20),
        
        // choosed headline 2 and edited on it
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 45, 
          fontWeight: FontWeight.w800,
          color: Colors.white),

          headline2: TextStyle(fontSize: 25, 
          fontWeight: FontWeight.bold,
          color: Colors.black),

          headline3: TextStyle(fontSize: 25, 
          fontWeight: FontWeight.bold,
          color: Colors.green),

           bodyText1: TextStyle(fontSize: 20, 
          fontWeight: FontWeight.w800,
          color: Colors.black),

          
        )
      ),
      
      
      home:Home(),
    );
  }
}



