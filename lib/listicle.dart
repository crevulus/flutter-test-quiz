import 'package:flutter/material.dart';

class Listicle extends StatefulWidget {
  @override
  ListicleState createState() => ListicleState();
}

class ListicleState extends State<Listicle> {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];
  final List<int> colorCodes = <int>[600, 500, 100, 600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 400,
          child: ListView.builder(
              primary: false,
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  color: Colors.green[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              }),
        ),
      ],
    );
  }
}
