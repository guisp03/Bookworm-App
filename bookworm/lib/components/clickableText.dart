import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {
  final double top;
  final double bottom;
  final Function onClick;
  final Widget widget;

  ClickableText(this.top, this.bottom, this.onClick, this.widget);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: widget,
      ),
    );
  }
}