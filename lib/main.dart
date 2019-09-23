import 'package:flutter/material.dart';
import 'package:flutter_movie_db/home.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Home(),
    ),
    theme: new ThemeData.dark(),
  ));
}
