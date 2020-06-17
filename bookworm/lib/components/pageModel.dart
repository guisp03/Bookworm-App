import 'package:flutter/material.dart';

import 'customAppBar.dart';
import 'customDrawer.dart';

class PageModelScreen extends StatelessWidget {
  final String title;
  final Widget widget;

  PageModelScreen(this.title, this.widget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: title),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/fundo.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(top: 100.0),
            padding: EdgeInsets.all(16.0),
            color: Color.fromRGBO(25, 50, 60, 0.85),
            child: widget,
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
