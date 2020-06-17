import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final Function onClick;
  final Widget widget;

  ClickableText(this.onClick, this.widget);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: widget,
      ),
    );
  }
}