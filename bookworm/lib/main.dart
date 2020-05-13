import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Acervo(),
    );
  }
}

class Acervo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'images/fundo.jpeg',
            fit: BoxFit.cover,
          ),
          ListView.builder(
            itemBuilder: (BuildContext context, int i) {
              if (i % 2 == 0)
                return _title();
              else
                return _horizontalListView();
            },
          ),
        ],
      ),
    );
  }
}

Widget _horizontalListView() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0, bottom: 24.0, right: 48, left:48),
    child: SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => _buildBox2(),
      ),
    ),
  );
}

Widget _title() {
  return Text(
    'Qualquer texto',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 32),
  );
}

Widget _buildBox2() {
  return Container(
    width: 130,
    color: Colors.white70,
    margin: EdgeInsets.only(right: 64),
  );
}
