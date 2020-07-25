import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/screens/product.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'Acervo',
      _books(context),
    );
  }

  MediaQuery _books(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemBuilder: (context, i) {
          return i == 0
              ? CustomTextField(
                  TextStyle(
                    fontSize: 25.0,
                    height: 0.75,
                    fontWeight: FontWeight.bold,
                  ),
                  false,
                  Color.fromRGBO(170, 187, 2014, 0.9),
                  null,
                  TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  Icons.search,
                )
              : Column(
                  children: <Widget>[
                    Text(
                      'Qualquer texto',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14,
                        bottom: 14,
                        right: 38,
                        left: 38,
                      ),
                      child: SizedBox(
                        height: 200,
                        child: _booksByCategorie(),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  ListView _booksByCategorie() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return _book(context);
      },
    );
  }

  GestureDetector _book(context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductScreen()),
        );
      },
      child: Container(
        width: 130,
        color: Colors.white70,
        margin: EdgeInsets.only(
          right: 46,
        ),
      ),
    );
  }
}
