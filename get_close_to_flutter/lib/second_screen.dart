import 'package:flutter/material.dart';
import 'package:get_close_to_flutter/list_box.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Widget> boxes;
  @override
  void initState() {
    super.initState();
    boxes = List.generate(2, (index) => ListBox(UniqueKey()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: boxes,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            boxes.insert(1, boxes.removeAt(0));
          });
        },
        child: Icon(
          Icons.swap_horiz,
        ),
      ),
    );
  }
}
