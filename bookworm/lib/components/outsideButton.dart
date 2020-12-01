import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teste/util/resize.dart';

class OutsideButton extends StatelessWidget {
  final Function onClick;
  final String name;
  final double horizontalPadding;

  const OutsideButton(
    this.onClick,
    this.name,
    this.horizontalPadding,
  );

  @override
  Widget build(BuildContext context) {
    Resize resize = new Resize();
    resize.getWidthAndHeight(context);
    return Padding(
      padding: EdgeInsets.only(
        top: resize.getHeight(24.0),
        bottom: resize.getHeight(24.0),
      ),
      child: FlatButton(
        onPressed: onClick,
        child: Text(
          name,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        color: Color.fromRGBO(25, 50, 60, 1),
        padding: EdgeInsets.only(
          top: resize.getHeight(16.0),
          bottom: resize.getHeight(16.0),
          right: horizontalPadding,
          left: horizontalPadding,
        ),
      ),
    );
  }
}
