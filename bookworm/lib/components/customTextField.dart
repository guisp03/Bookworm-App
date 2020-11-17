import 'package:flutter/material.dart';

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
    return Padding(
      padding: EdgeInsets.only(
        top: 24.0,
        bottom: 24.0,
        right: 48.0,
        left: 48.0,
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
              ImageIcon(icon, color: Color.fromRGBO(25, 50, 60, 1), size: 36.0),
        ),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
