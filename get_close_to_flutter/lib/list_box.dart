import 'dart:math';

import 'package:flutter/material.dart';

class ListBox extends StatefulWidget {
  ListBox(key) : super(key: key);
  @override
  _ListBoxState createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  List colors = [
    Colors.orange,
    Colors.blue,
  ];
  Random random = Random();
  Color color;
  @override
  void initState() {
    super.initState();
    color = colors[random.nextInt(2)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: color,
    );
  }
}
