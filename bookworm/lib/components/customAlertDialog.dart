import 'package:flutter/material.dart';
import 'package:teste/components/clickableIcon.dart';
import 'package:teste/main.dart';
import 'package:teste/util/resize.dart';

class CustomAlertDialog extends StatelessWidget {
  final Widget widget;
  final String text;

  const CustomAlertDialog(this.widget, [this.text = 'Aviso']);
  @override
  Widget build(BuildContext context) {
    Resize resize = new Resize();
    resize.getWidthAndHeight(context);
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          ClickableIcon(
            () {
              Navigator.pop(context);
            },
            AssetImage("assets/images/fechar.png"),
            resize.getWidth(32.0),
          ),
        ],
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
