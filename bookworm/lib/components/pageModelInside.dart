import 'package:flutter/material.dart';
import 'customAppBar.dart';
import 'customDrawer.dart';

class PageModelInsideScreen extends StatelessWidget {
  final String title;
  final Widget widget;

  PageModelInsideScreen(this.title, this.widget);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/fundo.jpeg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(title: title),
        backgroundColor: Colors.transparent,
        body: Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.all(
            16.0,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(25, 50, 60, 0.85),
          child: widget,
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
