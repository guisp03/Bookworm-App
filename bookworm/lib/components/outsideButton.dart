import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    ScreenUtil.init(context, designSize: Size(412, 732), allowFontScaling: false);
    return Padding(
      padding: EdgeInsets.only(
        top: 24.0.h,
        bottom: 24.0.h,
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
            top: 16.0.h,
            bottom: 16.0.h,
            right: horizontalPadding,
            left: horizontalPadding,
            ),
      ),
    );
  }
}