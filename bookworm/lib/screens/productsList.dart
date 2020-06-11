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
            'assets/images/fundoEscuro.png',
            fit: BoxFit.cover,
          ),
          _books(),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }

  ListView _books() {
    return ListView.builder(
      itemBuilder: (context, i) {
        return i == 0
            ? _search()
            : Column(
                children: <Widget>[
                  Text(
                    'Qualquer texto',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, bottom: 24.0, right: 48.0, left: 48.0),
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
        margin: EdgeInsets.only(right: 56),
      ),
    );
  }
}

Padding _search() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      style: TextStyle(fontSize: 25, height: 0.5, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(170, 187, 2014, 0.9),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        icon: Icon(Icons.search),
        hintText: 'Pesquise por título, gênero...',
      ),
    ),
  );
}
