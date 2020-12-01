import 'package:flutter/material.dart';
import 'package:teste/util/resize.dart';
import 'customAppBar.dart';
import 'customDrawer.dart';

class PageModelInsideScreen extends StatelessWidget {
  final String title;
  final Widget widget;
  final int id;

  PageModelInsideScreen(this.title, this.widget, this.id);

  @override
  Widget build(BuildContext context) {
    Resize resize = new Resize();
    resize.getWidthAndHeight(context);
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
          margin: EdgeInsets.only(top: resize.getHeight(100)),
          padding: EdgeInsets.all(
            resize.getWidth(16.0),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(25, 50, 60, 0.85),
          child: widget,
        ),
        drawer: CustomDrawer(id),
      ),
    );
  }
}
