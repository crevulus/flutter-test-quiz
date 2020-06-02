import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App')),
      body: Column(children: [
        Text('Q1'),
        RaisedButton(child: Text('A1'), onPressed: null),
        RaisedButton(child: Text('A2'), onPressed: null),
        RaisedButton(child: Text('A3'), onPressed: null)
      ],))
    );
  }
}
