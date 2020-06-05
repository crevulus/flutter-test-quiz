import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './result.dart';
import './listicle.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // adding _ turns public class to private class
  var _questionIndex = 0;
  var _totalScore = 0;
  int _selectedIndex = 0;

  final _questions = const [
    // const = constant value at compile time. Can add in front of value too, unlike JS.
    {
      'question': 'What\'s love got to do with it?',
      'answers': [
        {'text': 'A', 'score': 1},
        {'text': 'B', 'score': 2},
        {'text': 'C', 'score': 3},
      ],
      'correct': 0,
    },
    {
      'question': 'Where is the love?',
      'answers': [
        {'text': 'A', 'score': 1},
        {'text': 'B', 'score': 2},
        {'text': 'C', 'score': 3},
      ],
      'correct': 0,
    },
    {
      'question': 'How deep is your love?',
      'answers': [
        {'text': 'A', 'score': 1},
        {'text': 'B', 'score': 2},
        {'text': 'C', 'score': 3},
      ],
      'correctIndex': 0,
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _givenAnswer(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      // calls build on widget where you call setState (in this case MyApp)
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pushSaved();
  }

  void _pushSaved() {
    Navigator.of(context).push();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My First App')),
          body: _questionIndex < _questions.length
            ? Column(
              children: [
                Question(_questions[_questionIndex]['question']),
                ...(_questions[_questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  // map makes a new list based on original
                  return Answer(
                      () => _givenAnswer(answer['score']),
                      answer[
                          'text']); // _givenAnswer executed when onPressed is triggered
                }).toList(),
                Text(
                  'Test listicle',
                  style: TextStyle(fontSize: 28),
                ), // returns iterable parent fn not list, so need to call toList
                Listicle(),
              ],
            )
          : Result(_totalScore, _resetQuiz),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.help_outline),
                title: Text('Quiz'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle),
                title: Text('Results'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                title: Text('Account'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue[600],
            onTap: _onItemTapped,
          ),
    ));
  }
}
