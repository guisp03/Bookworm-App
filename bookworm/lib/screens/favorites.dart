import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/models/leitor.dart';
import 'package:teste/models/produto.dart';
import 'package:teste/screens/product.dart';
import 'package:teste/util/resize.dart';

class FavoritesScreen extends StatefulWidget {
  final int id;
  final List<int> favoritos;

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
  List<Produto> produtosFavoritos = [];
  List<int> favoritos = [];
  Resize resize = new Resize();

  @override
  void initState() {
    super.initState();
    future = produtoClienteWeb.getProdutoWeb(page);
    favoritos = widget.favoritos;
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
                produtoWeb.produtos.forEach((element) => produtos.add(element));
                produtos.forEach((element) =>
                    widget.favoritos.contains(element.idProduto)
                        ? produtosFavoritos.add(element)
                        : () {});
                produtosFavoritos.forEach((element) =>
                    element.generos.forEach((item) => generos.add(item)));
                generos = generos.toSet().toList();
                if (produtosFavoritos.isNotEmpty) {
                  return Column(
                    children: [
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: produtosFavoritos.length == 1 ? produtosFavoritos.length : produtosFavoritos.length ~/ 2,
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductScreen(
                                                widget.id,
                                                produtosFavoritos[j].idProduto,
                                                produtosFavoritos[j].nome,
                                                produtosFavoritos[j].imagem,
                                                produtosFavoritos[j].editora,
                                                produtosFavoritos[j].anoEdicao,
                                                produtosFavoritos[j]
                                                    .tipoProduto,
                                                produtosFavoritos[j].autores,
                                                produtosFavoritos[j]
                                                    .generos
                                                    .join(", "),
                                                produtosFavoritos[j].descricao,
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        child: Image(
                                          image: produtosFavoritos[j].imagem,
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
                      ),
                      widget.favoritos.length > produtosFavoritos.length
                          ? ClickableText(16, 16, () {
                              setState(() {
                                page++;
                                future = produtoClienteWeb.getProdutoWeb(page);
                              });
                            }, Text('Carregar mais'))
                          : Text(''),
                    ],
                  );
                }
              }
              return Text(
                'Falha ao buscar produtos!\n Tente novamente!',
                textAlign: TextAlign.center,
              );
              break;
          }
          return Text('Falha deconhecida!\n Tente novamente!',
              textAlign: TextAlign.center);
        },
      )),
      widget.id,
    );
  }
}
