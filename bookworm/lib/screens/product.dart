import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/customAppBar.dart';

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
          Image.asset('assets/images/fundo.png', fit: BoxFit.cover),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 75.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 130,
                          child: Image.asset(
                            'assets/images/orgulho.webp',
                            fit: BoxFit.cover,
                          ),
                        ),
                        ProductDescriptionExpanded('Orgulho e Preconceito\n',
                            'A história de um amor improvável em uma época em que sentimentos poderiam não ser suficientes. \n Quando Elizabeth Bennet conhece o cobiçado Fitzwilliam Darcy, não hesita em julgá-lo arrogante e presunçoso, afinal ele parece desprezar sua companhia, assim como a de todo mundo, demonstrando um temperamento rude e orgulhoso, impossível de agradar. Após descobrir o envolvimento do detestável cavalheiro nos eventos que separaram sua querida irmã, Jane, do jovem Bingley, Elizabeth está determinada a odiá-lo ainda mais. Uma surpreendente reviravolta, porém, poderá provar que as primeiras impressões nem sempre são incontestáveis.'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoButton(
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductDescriptionExpanded extends StatefulWidget {
  final String name;
  final String description;

  ProductDescriptionExpanded(this.name, this.description);

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

    if (widget.description.length > 200) {
      description1 = widget.description.substring(0, 200);
      description2 =
          widget.description.substring(50, widget.description.length);
    } else {
      description1 = widget.description;
      description2 = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: description2.isEmpty
          ? _productDescriptionText(context)
          : Column(
              children: <Widget>[
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
                    style: Theme.of(context).textTheme.bodyText1,
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
        text: TextSpan(
          text: widget.name,
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
