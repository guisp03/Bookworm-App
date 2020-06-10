import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final String title;

  CustomAppBar({@required this.title});

  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      backgroundColor: Color.fromRGBO(25, 50, 60, 0.85),
      centerTitle: true,
    );
  }
}
