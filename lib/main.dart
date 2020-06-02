import 'package:flutter/material.dart';

import './question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> { // adding _ turns public class to private class
  var _questionIndex = 0;

  void _givenAnswer() {
    setState(() { // calls build on widget where you call setState (in this case MyApp)
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s love got to do with it?',
      'Where is the love?',
      'How deep is your love?'
    ];
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App')),
      body: Column(children: [
        Question(questions[_questionIndex]),
        RaisedButton(child: Text('A1'), onPressed: _givenAnswer), // pass name of function as onPressed requires a fn, not the return value of a fn
        RaisedButton(child: Text('A2'), onPressed: _givenAnswer),
        RaisedButton(child: Text('A3'), onPressed: _givenAnswer)
      ],))
    );
  }
}
