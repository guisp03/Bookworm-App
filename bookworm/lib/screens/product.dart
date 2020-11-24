import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/customCalendar.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';

class ProductScreen extends StatefulWidget {
  final String nomeProduto;
  final ImageProvider imagem;
  final String editora;
  final String anoEdicao;
  final String tipoproduto;
  final String autores;
  final String nomeGenero;
  final String descricao;

  const ProductScreen(
    this.nomeProduto,
    this.imagem,
    this.editora,
    this.anoEdicao,
    this.tipoproduto,
    this.autores,
    this.nomeGenero,
    this.descricao,
  );

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  _ProductScreenState();

  AssetImage fav = AssetImage("assets/images/fav.png");

  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'Acervo',
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  widget.nomeProduto,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.5) - 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 16),
                            height: 240.0,
                            width: 156.0,
                            child: Image(
                              image: widget.imagem,
                              fit: BoxFit.cover,
                            ),
                          ),
                          _productInformation(
                              context, 'Editora: ' + widget.editora),
                          _productInformation(
                              context, 'Ano edição: ' + widget.anoEdicao),
                          ClickableText(
                            16.0,
                            0.0,
                            () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => CustomAlertDialog(
                                  Column(
                                    children: <Widget>[
                                      ClickableText(0.0, 0.0, () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (_) => CustomAlertDialog(
                                            Column(
                                              children: <Widget>[
                                                Text(
                                                    "Reservar para o dia tal?"),
                                                    Image.asset('assets/images/ratinholivro.png'),
                                                ClickableText(
                                                  0.0,
                                                  0.0,
                                                  () {},
                                                  TextWithIcon(
                                                    AssetImage(
                                                        "assets/images/reservar.png"),
                                                    Text(
                                                      "Reservar",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            'Reserva',
                                          ),
                                        );
                                      }, CustomCalendar()),
                                    ],
                                  ),
                                  'Calendário',
                                ),
                              );
                            },
                            TextWithIcon(
                              AssetImage("assets/images/reservar.png"),
                              Text(
                                'Reservar',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                          ClickableText(
                            16.0,
                            8.0,
                            () {
                              setState(() {
                                fav == AssetImage("assets/images/fav.png")
                                    ? fav = AssetImage("assets/images/favp.png")
                                    : fav = AssetImage("assets/images/fav.png");
                              });
                            },
                            TextWithIcon(
                              fav,
                              Text(
                                'Favoritos',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.5) - 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _productInformation(
                              context, 'Autores: ' + widget.autores),
                          _productInformation(
                              context, 'Gênero: ' + widget.nomeGenero),
                          _ExpandedText(widget.descricao)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Padding _productInformation(BuildContext context, String information) {
  return Padding(
    padding: EdgeInsets.only(top: 16.0),
    child: Text(
      information,
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}

class _ExpandedText extends StatefulWidget {
  final String description;

  _ExpandedText(this.description);

  @override
  __ExpandedTextState createState() => __ExpandedTextState();
}

class __ExpandedTextState extends State<_ExpandedText> {
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
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      width: orientation == Orientation.portrait ? 190.0 : 350.0,
      child: description2.isEmpty
          ? _productDescriptionText(context)
          : Column(
              children: <Widget>[
                _productDescriptionText(context),
                ClickableText(
                  8.0,
                  8.0,
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
