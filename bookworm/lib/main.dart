import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PopUp(),
    );
  }
}

class PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 600)
          ],
        ),
      ),
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
  return SizedBox(
    height: 200,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, __) => _buildBox2(
        color: Colors.white,
      ),
    ),
  );
}

Widget _title() {
  return Text('Qualquer texto');
}

Widget _buildBox2({Color color}) {
  return Container(
    margin: EdgeInsets.all(12),
    width: 120,
    color: color,
  );
}
