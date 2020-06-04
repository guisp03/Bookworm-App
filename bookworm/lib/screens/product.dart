import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/customAppBar.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  DateTime _date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: _date,
      lastDate: DateTime(3000),
      locale: Locale('pt'),
    );
    if (_date != null) {
      print(_date.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(title: 'Acervo'),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/fundo.jpeg',
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    height: 200,
                    width: 130,
                    child: Image.asset(
                      'assets/images/orgulho.jpg',
                      fit: BoxFit.cover,

                    ),
                  ),
                  Expanded(child:Container(
                    margin: const EdgeInsets.only(top: 120),
                      height: 450,
                      width: 210,
                      child: RichText(
                            text: TextSpan(
                            text: 'Orgulho e Preconceito \n ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: 'A história de um amor improvável em uma época em que sentimentos poderiam não ser suficientes. \n Quando Elizabeth Bennet conhece o cobiçado Fitzwilliam Darcy, não hesita em julgá-lo arrogante e presunçoso, afinal ele parece desprezar sua companhia, assim como a de todo mundo, demonstrando um temperamento rude e orgulhoso, impossível de agradar. Após descobrir o envolvimento do detestável cavalheiro nos eventos que separaram sua querida irmã, Jane, do jovem Bingley, Elizabeth está determinada a odiá-lo ainda mais. Uma surpreendente reviravolta, porém, poderá provar que as primeiras impressões nem sempre são incontestáveis.', style: TextStyle(fontSize: 15)),
                            ],
                            ),
                            )

                  ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(64.0),
                child: CupertinoButton(
                  onPressed: () {
                    print(_date.toString());
                    setState(() {
                      _selectDate(context);
                    });
                  },
                  child: Text(
                    'Reservar',
                     style: TextStyle(fontSize: 20)
                  color: Colors.indigoAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
