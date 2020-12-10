import 'package:flutter/material.dart';
import 'package:wallpaperapp/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Fredoka One'
      ),
      home: Home(),
    );
  }
}

