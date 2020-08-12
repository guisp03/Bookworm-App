import 'package:flutter/material.dart';
import 'package:teste/components/clickableIcon.dart';
import 'package:teste/main.dart';


class CustomAlertDialog extends StatelessWidget {
  final Widget widget;

  const CustomAlertDialog(
    this.widget,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.topRight,
        child: ClickableIcon(
          () {
            Navigator.pop(context);
          },
          AssetImage("assets/images/fechar.png"),
          32.0,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget,
        ],
      ),
      backgroundColor: BookwormApp.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
    );
  }
}