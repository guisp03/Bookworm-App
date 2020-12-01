import 'package:flutter/material.dart';
import 'package:teste/util/resize.dart';

class CustomTextField extends StatelessWidget {
  final TextStyle style;
  final bool isPassword;
  final Color color;
  final String hintText;
  final TextStyle hintStyle;
  final ImageProvider icon;
  final TextEditingController controller;
  final Function onChanged;

  const CustomTextField(
    this.style,
    this.isPassword,
    this.color,
    this.hintText,
    this.hintStyle,
    this.icon,
    this.controller,
    this.onChanged,
  );

  @override
  Widget build(BuildContext context) {
    Resize resize = new Resize();
    resize.getWidthAndHeight(context);
    return Padding(
      padding: EdgeInsets.only(
        top: resize.getHeight(24.0),
        bottom: resize.getHeight(24.0),
        right: resize.getWidth(48.0),
        left: resize.getWidth(48.0),
      ),
      child: TextField(
        style: style,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon:
              ImageIcon(icon, color: Color.fromRGBO(25, 50, 60, 1), size: resize.getWidth(36.0)),
        ),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
