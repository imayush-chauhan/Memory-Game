import 'package:flutter/material.dart';
import 'package:memory/screen/home%20screen.dart';

void main(){
  runApp(MaterialApp(
    title: "Memory Game",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color(0xffC850C0),
    ),
    home: HomeScreen(),
  ));
}