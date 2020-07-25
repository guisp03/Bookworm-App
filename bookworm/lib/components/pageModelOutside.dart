import 'package:flutter/material.dart';
import '../main.dart';

class PageModelOutside extends StatelessWidget {
  final double topPadding;
  final String title;
  final double fontSize;
  final Widget widget;

  const PageModelOutside(
    this.topPadding,
    this.title,
    this.fontSize,
    this.widget,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/fundo.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.25),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: BookwormApp.darkBlue,
                    ),
                  ),
                  widget
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
