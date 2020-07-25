import 'package:flutter/cupertino.dart';

class TextWithIcon extends StatelessWidget {
  final ImageProvider imageIcon;
  final Text text;

  const TextWithIcon(
    this.imageIcon,
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: ImageIcon(
            imageIcon,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        text,
      ],
    );
  }
}
