import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:teste/models/leitor.dart';

class ProductScreen extends StatefulWidget {
  final int id;
  final int idProduto;
  final String nomeProduto;
  final ImageProvider imagem;
  final String editora;
  final String anoEdicao;
  final String tipoproduto;
  final String autores;
  final String nomeGenero;
  final String descricao;

  const ProductScreen(
    this.id,
    this.idProduto,
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

  LeitorWeb leitorWeb = new LeitorWeb();
  Leitor leitor;
  Future<Leitor> future;
  List<int> favoritos = [];
  Favoritos favoritosWeb = new Favoritos();
  Resultado resultado;

  dynamic fav;

  @override
  void initState() {
    super.initState();
    future = leitorWeb.getLeitor(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'Acervo',
      SingleChildScrollView(
        child: FutureBuilder<Leitor>(
            future: future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Column(
                    children: [
                      Center(
                        child:
                            Image.asset('assets/images/ratinhoprateleira.png'),
                      ),
                      Text(
                        'Buscando dados',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  );
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    leitor = snapshot.data;
                    favoritos = leitor.favoritos;
                    favoritos.contains(widget.idProduto)
                        ? fav = AssetImage("assets/images/favp.png")
                        : fav = AssetImage("assets/images/fav.png");
                    return Column(
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
                                  width: (MediaQuery.of(context).size.width *
                                          0.5) -
                                      16,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      _productInformation(context,
                                          'Editora: ' + widget.editora),
                                      _productInformation(
                                          context,
                                          'Ano edição: ' +
                                              widget.anoEdicao.substring(0, 4)),
                                      ClickableText(
                                        16.0,
                                        0.0,
                                        () {
                                          showRoundedDatePicker(
                                            context: context,
                                            fontFamily: 'JosefinSans',
                                            textNegativeButton: 'Cancelar',
                                            textPositiveButton: 'Ok',
                                            height: 340,
                                            theme: ThemeData(
                                                primaryColor:
                                                    Color.fromRGBO(0, 0, 0, 0)),
                                            styleDatePicker:
                                                MaterialRoundedDatePickerStyle(
                                              paddingDatePicker:
                                                  EdgeInsets.only(
                                                      left: 8, right: 8),
                                              paddingActionBar: EdgeInsets.zero,
                                              paddingDateYearHeader:
                                                  EdgeInsets.zero,
                                              textStyleDayButton: TextStyle(
                                                  fontSize: 0,
                                                  color: Color.fromRGBO(
                                                      25, 50, 60, 0.85)),
                                              textStyleYearButton: TextStyle(
                                                  fontSize: 0,
                                                  color: Color.fromRGBO(
                                                      25, 50, 60, 0.85)),
                                              textStyleCurrentDayOnCalendar:
                                                  TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'JosefinSans'),
                                              textStyleDayOnCalendar: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              textStyleDayOnCalendarSelected:
                                                  TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'JosefinSans'),
                                              textStyleDayHeader: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'JosefinSans'),
                                              textStyleMonthYearHeader:
                                                  TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'JosefinSans'),
                                              textStyleButtonNegative:
                                                  TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'JosefinSans'),
                                              textStyleButtonPositive:
                                                  TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'JosefinSans'),
                                              textStyleDayOnCalendarDisabled:
                                                  TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'JosefinSans'),
                                              paddingMonthHeader:
                                                  EdgeInsets.all(28),
                                              sizeArrow: 30,
                                              colorArrowNext: Colors.white,
                                              colorArrowPrevious: Colors.white,
                                              marginLeftArrowPrevious: 12,
                                              marginRightArrowNext: 12,
                                              marginTopArrowNext: 12,
                                              marginTopArrowPrevious: 12,
                                              decorationDateSelected:
                                                  BoxDecoration(
                                                      color:
                                                          Color.fromRGBO(25, 50,
                                                              60, 0.85),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 1)),
                                              backgroundPicker: Color.fromRGBO(
                                                  25, 50, 60, 0.85),
                                              backgroundActionBar:
                                                  Color.fromRGBO(
                                                      25, 50, 60, 0.85),
                                              backgroundHeaderMonth:
                                                  Color.fromRGBO(
                                                      25, 50, 60, 0.85),
                                            ),
                                            styleYearPicker:
                                                MaterialRoundedYearPickerStyle(
                                              textStyleYear: TextStyle(
                                                  fontSize: 50,
                                                  color: Colors.white),
                                              heightYearRow: 0,
                                            ),
                                            onTapDay: (DateTime dateTime,
                                                bool availble) {
                                              if (availble) {
                                                showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder: (_) =>
                                                        CustomAlertDialog(Text(
                                                            'Livro reservado com sucesso!')));
                                              }
                                              return !availble;
                                            },
                                            builderDay: (DateTime dateTime,
                                                bool isCurrentDay,
                                                bool isSelected,
                                                TextStyle defaultTextStyle) {
                                              if (isSelected) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border:
                                                        Border.all(width: 1),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                          dateTime.day
                                                              .toString(),
                                                          style:
                                                              defaultTextStyle)),
                                                );
                                              }
                                              return Container(
                                                child: Center(
                                                  child: Text(
                                                    dateTime.day.toString(),
                                                    style: defaultTextStyle,
                                                  ),
                                                ),
                                              );
                                            },
                                            initialDate: DateTime.now(),
                                            firstDate:
                                                DateTime(DateTime.now().year),
                                            lastDate: DateTime(
                                                DateTime.now().year + 1),
                                            borderRadius: 16,
                                          );
                                        },
                                        TextWithIcon(
                                          AssetImage(
                                              "assets/images/reservar.png"),
                                          Text(
                                            'Reservar',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                      ClickableText(
                                        16.0,
                                        8.0,
                                        () async {
                                          print(favoritos);
                                          if (fav ==
                                              AssetImage(
                                                  "assets/images/favp.png")) {
                                            favoritos.removeWhere((element) =>
                                                element == widget.idProduto);
                                            resultado = await favoritosWeb
                                                .putFavoritos(
                                                    widget.id, favoritos)
                                                .catchError((e) => showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder: (_) =>
                                                        CustomAlertDialog(Text(
                                                            'Favoritos ataulizados com sucesso!!'))));
                                            if (resultado.code == 200) {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (_) =>
                                                      CustomAlertDialog(Text(
                                                          'Favoritos ataulizados com sucesso!')));
                                              fav = AssetImage(
                                                  "assets/images/favp.png");
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (_) =>
                                                      CustomAlertDialog(Text(
                                                          'Favoritos ataulizados com sucesso!')));
                                            }
                                          } else {
                                            favoritos.add(widget.idProduto);
                                            resultado = await favoritosWeb
                                                .putFavoritos(
                                                    widget.id, favoritos)
                                                .catchError((e) => showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder: (_) =>
                                                        CustomAlertDialog(Text(
                                                            'Favoritos ataulizados com sucesso!'))));
                                            if (resultado.code == 200) {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (_) =>
                                                      CustomAlertDialog(Text(
                                                          'Favoritos ataulizados com sucesso!')));
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (_) =>
                                                      CustomAlertDialog(Text(
                                                          'Favoritos ataulizados com sucesso!')));
                                            }
                                          }
                                        },
                                        TextWithIcon(
                                          fav,
                                          Text(
                                            'Favoritos',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: (MediaQuery.of(context).size.width *
                                          0.5) -
                                      16,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      _productInformation(context,
                                          'Autores: ' + widget.autores),
                                      _productInformation(context,
                                          'Gênero: ' + widget.nomeGenero),
                                      _ExpandedText(widget.descricao)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  }
              }
            }),
      ),
      widget.id,
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
