import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/screens/product.dart';

class Genero {
  final int id;
  final String nome;

  Genero(this.id, this.nome);
}

class GenerosListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Genero> generos = [
      Genero(1, "rock"),
      Genero(2, "Ficção"),
      Genero(3, "Comédia")
    ];
    return _generosListView(generos);
  }

  ListView _generosListView(data) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (__, _) {
          return Column(
            children: <Widget>[
              Text(
                data[_].nomeGenero,
                textAlign: TextAlign.center,
                style: Theme.of(__).textTheme.subtitle2,
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
        });
  }
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
