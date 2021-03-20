import 'package:flutter/material.dart';
import 'package:memory/screen/home%20screen.dart';
import 'package:memory/screen/memoryGame.dart';

void main(){
  runApp(MaterialApp(
    title: "Memory Game",
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}