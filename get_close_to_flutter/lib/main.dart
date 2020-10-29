import 'package:flutter/material.dart';
import 'package:get_close_to_flutter/first_screen.dart';
import 'package:get_close_to_flutter/second_screen.dart';
import 'package:get_close_to_flutter/thirst_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}
