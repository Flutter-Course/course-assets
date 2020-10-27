import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showFirst = true;
  Widget firstTree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Hello Flutter'),
        SizedBox(width: 10),
        Image.asset('assets/images/flutter.png', height: 40),
      ],
    );
  }

  Widget secondTree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Hello Dart'),
        SizedBox(width: 10), // Padding(padding: EdgeInsets.only(right: 10)),
        Image.asset('assets/images/dart.png', height: 40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: (showFirst) ? firstTree() : secondTree(),
          ),
          RaisedButton(
            child: Text(
              'Toggle Statement',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
            onPressed: () {
              setState(() {
                showFirst = !showFirst;
              });
            },
          ),
        ],
      ),
    );
  }
}
