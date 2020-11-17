import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/models/produto.dart';
import 'package:teste/screens/product.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProdutoClienteWeb produtoClienteWeb = new ProdutoClienteWeb();
  ProdutoWeb produtoWeb;
  Future<ProdutoWeb> future;
  List<Produto> produtos = [];
  List<String> generos = [];
  int page = 1;
  int count = 0;
  String search = '';

  @override
  void initState() {
    super.initState();
    future = produtoClienteWeb.getProdutoWeb(page);
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

  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
        'Acervo',
        SingleChildScrollView(
          child: FutureBuilder<ProdutoWeb>(
            future: future,
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
                    produtoWeb = snapshot.data;
                    count = count + produtoWeb.count;
                    produtoWeb.produtos
                        .forEach((element) => produtos.add(element));
                    produtos.forEach((element) =>
                        element.generos.forEach((item) => generos.add(item)));
                    generos = generos.toSet().toList();
                    if (produtos.isNotEmpty) {
                      return Column(
                        children: [
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
                            AssetImage('assets/images/pesquisa.png'),
                            null,
                            (value) => setState(() {
                              search = value;
                              produtos.clear();
                              count = 0;
                            }),
                          ),
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: generos.length,
                              itemBuilder: (context, i) {
                                List<Produto> listaprodutosDoGenero =
                                    separarProdutos(generos[i]);
                                return Column(
                                  children: <Widget>[
                                    Text(
                                      generos[i],
                                      textAlign: TextAlign.center,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
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
                                              listaprodutosDoGenero.length,
                                          itemBuilder: (context, j) {
                                            if (listaprodutosDoGenero[j]
                                                .nome
                                                .contains(search)) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => ProductScreen(
                                                              listaprodutosDoGenero[
                                                                      j]
                                                                  .nome,
                                                              listaprodutosDoGenero[
                                                                      j]
                                                                  .imagem,
                                                              listaprodutosDoGenero[
                                                                      j]
                                                                  .editora,
                                                              listaprodutosDoGenero[
                                                                      j]
                                                                  .anoEdicao,
                                                              listaprodutosDoGenero[
                                                                      j]
                                                                  .tipoProduto,
                                                              listaprodutosDoGenero[
                                                                      j]
                                                                  .autores,
                                                              generos[i],
                                                              listaprodutosDoGenero[
                                                                      j]
                                                                  .descricao)));
                                                },
                                                child: Container(
                                                  child: Image(
                                                    image:
                                                        listaprodutosDoGenero[j]
                                                            .imagem,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  width: 130,
                                                  margin: EdgeInsets.only(
                                                      right: 46),
                                                ),
                                              );
                                            } else {
                                              return Text(
                                                '',
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          produtoWeb.totalCount > count
                              ? ClickableText(16, 16, () {
                                  setState(() {
                                    page++;
                                    future =
                                        produtoClienteWeb.getProdutoWeb(page);
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
          ),
        ));
  }
}
