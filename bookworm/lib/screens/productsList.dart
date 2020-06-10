import 'package:flutter/material.dart';
import 'package:teste/components/customAppBar.dart';
import 'package:teste/components/customDrawer.dart';
import 'package:teste/screens/product.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Acervo'),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/fundo.png',
            fit: BoxFit.cover,
          ),
          _buildBooks(),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }

  ListView _buildBooks() {
    return ListView.builder(
      itemBuilder: (context, i) {
        return Column(
          children: <Widget>[
            Text(
              'Qualquer texto',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, bottom: 24.0, right: 48, left: 48),
              child: SizedBox(
                height: 200,
                child: _booksByCategorie(),
              ),
            ),
          ],
        );
      },
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
        margin: EdgeInsets.only(right: 64),
      ),
    );
  }
}
