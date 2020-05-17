import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Acervo';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Acervo(),
    );
  }
}

class Acervo extends StatelessWidget {
  final String title;
  
  Acervo({Key key, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontFamily: 'JosefinSans', fontSize: 40.0),), backgroundColor: Colors.black87 , elevation: 0.3,centerTitle: true,
      ),
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
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 80.0,
                child:  DrawerHeader(
                  child: Text('Hello'),
                  decoration:BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),

              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);

                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);

                },
              ),
            ],
          ),
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
