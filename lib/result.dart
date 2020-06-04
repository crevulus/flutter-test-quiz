import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetHandler;
  final int resultScore;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore < 9) {
      resultText = 'Try again...';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(// Column takes all available height of viewport
          children: [
        Text(
          resultPhrase,
        ),
        RaisedButton(child: Text('Reset'), onPressed: this.resetHandler),
      ]),
    );
  }
}
