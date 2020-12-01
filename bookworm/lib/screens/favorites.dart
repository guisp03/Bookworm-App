import 'package:flutter/material.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/models/leitor.dart';
import 'package:teste/models/produto.dart';
import 'package:teste/util/resize.dart';

class FavoritesScreen extends StatefulWidget {
  final int id;
  final List<Favoritos> favoritos;

  FavoritesScreen(this.id, this.favoritos);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  ProdutoClienteWeb produtoClienteWeb = new ProdutoClienteWeb();
  ProdutoWeb produtoWeb;
  Future<ProdutoWeb> future;
  List<Produto> produtos = [];
  List<String> generos = [];
  int page = 1;
  String search = '';
  int count = 0;
  List<String> isbns = [];
  List<Produto> repetidos = [];
  Resize resize = new Resize();

  @override
  void initState() {
    super.initState();
    future = produtoClienteWeb.getProdutoWeb(page);
  }

  @override
  Widget build(BuildContext context) {
    resize.getWidthAndHeight(context);
    return PageModelInsideScreen(
      'Favoritos',
      SingleChildScrollView(
          child: FutureBuilder<ProdutoWeb>(
        future: future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Column(
                children: [
                  Center(
                    child: Image.asset('assets/images/ratinhoprateleira.png'),
                  ),
                  Text(
                    'Buscando favoritos',
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                produtoWeb = snapshot.data;
                count = count + produtoWeb.count;
                produtoWeb.produtos.forEach((element) =>
                    element.nome.contains(search)
                        ? produtos.add(element)
                        : () {});
                produtos.forEach((element) =>
                    element.generos.forEach((item) => generos.add(item)));
                generos = generos.toSet().toList();
                if (produtos.isNotEmpty) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: widget.favoritos.length ~/ 2,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: resize.getHeight(14),
                            bottom: resize.getHeight(14),
                            right: resize.getWidth(38),
                            left: resize.getWidth(38),
                          ),
                          child: SizedBox(
                            height: resize.getHeight(200),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, j) {
                                return GestureDetector(
                                  onTap: () {
                                    widget.favoritos
                                        .forEach((element) => print(element));
                                  },
                                  child: Container(
                                    child: Image(
                                      image: AssetImage('assets/images/fav.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    width: resize.getWidth(130),
                                    margin: EdgeInsets.only(
                                        right: resize.getWidth(46)),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
          }
        },
      )),
      widget.id,
    );
  }
}
