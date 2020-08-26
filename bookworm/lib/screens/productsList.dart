import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/models/genero.dart';
import 'package:teste/screens/product.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController _produtoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'Acervo',
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomTextField(
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
                _produtoController
              ),
              GenerosListView(),
          ],
        ),
      )
    );
  }
}