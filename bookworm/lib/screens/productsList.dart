import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/models/produto.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController _produtoController = TextEditingController();
  ProdutoClienteWeb produtoClienteWeb = new ProdutoClienteWeb();
  List<Produto> produtos = [];
  List<String> generos = [];
  Map<String, List<Produto>> produtosPorGenero = {};

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
                  _produtoController),
              MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: FutureBuilder<ProdutoWeb>(
                    future: produtoClienteWeb.getProdutoWeb(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          break;
                        case ConnectionState.waiting:
                          return CircularProgressIndicator();
                          break; //colocar indicador
                        case ConnectionState.active:
                          break;
                        case ConnectionState.done:
                          if (snapshot.hasData) {
                            final ProdutoWeb produtoWeb = snapshot.data;
                            produtos = produtoWeb.produtos;
                            produtos.forEach((element) => element.generos
                                .forEach((item) => generos.add(item)));
                            generos = generos.toSet().toList();
                            generos.forEach((element) =>
                                produtosPorGenero[element] =
                                    separarProdutos(element));
                            print(produtosPorGenero);
                            if (produtos.isNotEmpty) {
                              return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: generos.length,
                                itemBuilder: (context, i) {
                                  List<Produto> listaProdutosPorGenero =
                                      separarProdutos(generos[i]);
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        generos[i],
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
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
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                listaProdutosPorGenero.length,
                                            itemBuilder: (context, j) {
                                              return GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  child: Text(
                                                      listaProdutosPorGenero[j]
                                                          .nome),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          }
                          return Container(width: 0, height: 0);
                          break;
                      }
                      return Container(height: 0, width: 0);
                    },
                  ))
            ],
          ),
        ));
  }

  List<Produto> separarProdutos(String genero) {
    List<Produto> produtosDoGenero = [];
    for (var element in produtos) {
      for (var item in element.generos) {
        if (item == genero) {
          produtosDoGenero.add(element);
        }
      }
    }
    return produtosDoGenero;
  }
}
