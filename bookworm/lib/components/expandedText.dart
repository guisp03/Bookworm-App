import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';

class ProductDescriptionExpanded extends StatefulWidget {
  final String description;

  ProductDescriptionExpanded(this.description);
  @override
  _ProductDescriptionExpandedState createState() =>
      _ProductDescriptionExpandedState();
}

class _ProductDescriptionExpandedState
    extends State<ProductDescriptionExpanded> {
  String description1;
  String description2;
  bool read = true;

  @override
  void initState() {
    super.initState();

    if (widget.description.length > 97) {
      description1 = widget.description.substring(0, 97);
      description2 =
          widget.description.substring(97, widget.description.length);
    } else {
      description1 = widget.description;
      description2 = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      width: orientation == Orientation.portrait ? 190.0 : 350.0,
      child: description2.isEmpty
          ? _productDescriptionText(context)
          : Column(
              children: <Widget>[
                _productDescriptionText(context),
                ClickableText(
                  () {
                    setState(() {
                      read = !read;
                    });
                  },
                  Text(
                    read ? 'Leia mais' : 'Leia menos',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
    );
  }

  Container _productDescriptionText(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: Theme.of(context).textTheme.subtitle1,
          children: <TextSpan>[
            TextSpan(
              text: read ? (description1) : (description1 + description2),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
