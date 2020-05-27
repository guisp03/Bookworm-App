import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    height: 200,
                    width: 130,
                    color: Colors.white70,
                  ),
                  Text("Texto grandao")
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
                  child: Text('oi'),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
