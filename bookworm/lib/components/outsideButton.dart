import 'package:flutter/material.dart';

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
    return Padding(
      padding: EdgeInsets.only(
        top: 24.0,
        bottom: 24.0,
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
            top: 16.0,
            bottom: 16.0,
            right: horizontalPadding,
            left: horizontalPadding),
      ),
    );
  }
}
