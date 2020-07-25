import 'package:flutter/material.dart';

class ClickableIcon extends StatelessWidget {
  final Function onClick;
  final ImageProvider img;
  final double size;

  ClickableIcon(
    this.onClick,
    this.img,
    this.size,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: ImageIcon(
        img,
        color: Color.fromRGBO(255, 255, 255, 1),
        size: size,
      ),
    );
  }
}
