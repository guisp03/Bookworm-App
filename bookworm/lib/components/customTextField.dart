import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextStyle style;
  final Color color;
  final String labelText;
  final TextStyle labelStyle;
  final Icon icon;

  const CustomTextField(
    this.style,
    this.color,
    this.labelText,
    this.labelStyle,
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        bottom: 24.0,
        right: 48.0,
        left: 48.0,
      ),
      child: TextField(
        style: style,
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          labelText: labelText,
          labelStyle: labelStyle,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
