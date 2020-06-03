import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
      {
        'question': 'What\'s love got to do with it?',
        'answers': [
          'Everything',
          'Nothing'
        ]
      },
      {
        'question': 'Where is the love?',
        'answers': [
          'Everywhere',
          'Nowhere'
        ]
      },
      {
        'question': 'How deep is your love?',
        'answers': [
          'Half full',
          'Half empty'
        ]
      },
    ];
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App')),
      body: Column(children: [
        Question(questions[_questionIndex]['question']),
        ...(questions[_questionIndex]['answers'] as List<String>).map((answer) { // map makes a new list based on original
          return Answer(_givenAnswer, answer);
        }).toList() // returns iterable parent fn not list, so need to call toList
      ],))
    );
  }
}
