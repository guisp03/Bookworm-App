import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/customAppBar.dart';
import 'package:teste/components/customDrawer.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  DateTime _date = DateTime.now();

  _ProductScreenState();

  Future<Null> _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: _date,
      lastDate: DateTime(3000),
      locale: Locale('pt'),
    );
    if (_date != null) {
      print(
        _date.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Acervo',
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/images/fundoClaro.jpeg', fit: BoxFit.cover),
          Container(
            color: Color.fromRGBO(25, 50, 60, 0.85),
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                                'Orgulho e Preconceito',
                                    style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 250,
                                      width: 190,
                                      padding: const EdgeInsets.only(right: 10, left: 15, bottom: 20, top: 10),
                                      child: Image.asset(
                                        'assets/images/orgulho.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                        'CÓD: XYZABC\n',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                        'Editora: José \nOlympio\n',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                        'Ano edição: 2019\n',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                        'Exemplares \ndisponíneis: 2',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    CupertinoButton(
                                      onPressed: () {
                                        setState(() {
                                          _selectDate(context);
                                        });
                                      },
                                      child: Text(
                                        'Reservar',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[

                                    ProductDescriptionExpanded(
                                        'A história de um amor improvável em uma época em que sentimentos poderiam não ser suficientes. \n Quando Elizabeth Bennet conhece o cobiçado Fitzwilliam Darcy, não hesita em julgá-lo arrogante e presunçoso, afinal ele parece desprezar sua companhia, assim como a de todo mundo, demonstrando um temperamento rude e orgulhoso, impossível de agradar. Após descobrir o envolvimento do detestável cavalheiro nos eventos que separaram sua querida irmã, Jane, do jovem Bingley, Elizabeth está determinada a odiá-lo ainda mais. Uma surpreendente reviravolta, porém, poderá provar que as primeiras impressões nem sempre são incontestáveis.'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                    ),
                ],
              ),
            ),
          ),
          ],
      ),
      drawer: CustomDrawer(),
    );
  }
}

class ProductDescriptionExpanded extends StatefulWidget {
  final String description;

  ProductDescriptionExpanded(this.description);

  @override
  _ProductDescriptionExpandedState createState() =>
      _ProductDescriptionExpandedState();
}

class _ProductDescriptionExpandedState
    extends State<ProductDescriptionExpanded> {
  String description1;
  String description2;
  bool flag = true;

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
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: 190,
      child: description2.isEmpty
          ? _productDescriptionText(context)
          : Column(
        children: <Widget>[
          Text(
            'Autora: Jane Austen\n',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Gênero: Romance, \nFicção\n',
            style: Theme.of(context).textTheme.bodyText1,

          ),
          _productDescriptionText(context),
          FlatButton(
            onPressed: () {
              setState(
                    () {
                  flag = !flag;
                },
              );
            },
            child: Text(
              flag ? "Leia mais" : "Leia menos",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }

  Container _productDescriptionText(BuildContext context) {
    return Container(
      width: 250.0,
      child: RichText(
        textAlign: TextAlign.left,
        text:
        TextSpan(
          style: Theme.of(context).textTheme.subtitle1,
          children: <TextSpan>[
            TextSpan(
              text: flag ? (description1) : (description1 + description2),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
