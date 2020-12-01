import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:teste/models/produto.dart';

class CustomCalendar extends StatefulWidget {
  final int isbn;
  final int reservas;

  const CustomCalendar(
    this.isbn,
    this.reservas,
  );

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  ProdutoClienteWeb produtoClienteWeb = new ProdutoClienteWeb();
  ReservaWeb reservaWeb;
  Future<ReservaWeb> future;
  int isbn;
  int reservas;
  int count = 0;

  @override
  void initState() {
    super.initState();
    future = produtoClienteWeb.getReservaWeb(isbn);
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: () {
      if (isbn == reservas) {
        showDialog(
            context: context,
            builder: (c) => CupertinoAlertDialog(
                  title: Text('Este livro está indisponível!'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ));
      }
      Future<DateTime> selectDay = showRoundedDatePicker(
        context: context,
        fontFamily: 'JosefinSans',
        textNegativeButton: 'Cancelar',
        textPositiveButton: 'Ok',
        height: 340,
        theme: ThemeData(primaryColor: Color.fromRGBO(0, 0, 0, 0)),
        styleDatePicker: MaterialRoundedDatePickerStyle(
          paddingDatePicker: EdgeInsets.only(left: 8, right: 8),
          paddingActionBar: EdgeInsets.zero,
          paddingDateYearHeader: EdgeInsets.zero,
          textStyleDayButton:
              TextStyle(fontSize: 0, color: Color.fromRGBO(25, 50, 60, 0.85)),
          textStyleYearButton:
              TextStyle(fontSize: 0, color: Color.fromRGBO(25, 50, 60, 0.85)),
          textStyleCurrentDayOnCalendar: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'JosefinSans'),
          textStyleDayOnCalendar: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'JosefinSans'),
          textStyleDayOnCalendarSelected: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'JosefinSans'),
          textStyleDayHeader: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'JosefinSans'),
          textStyleMonthYearHeader: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'JosefinSans'),
          textStyleButtonNegative: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'JosefinSans'),
          textStyleButtonPositive: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'JosefinSans'),
          textStyleDayOnCalendarDisabled: TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'JosefinSans'),
          paddingMonthHeader: EdgeInsets.all(28),
          sizeArrow: 30,
          colorArrowNext: Colors.white,
          colorArrowPrevious: Colors.white,
          marginLeftArrowPrevious: 12,
          marginRightArrowNext: 12,
          marginTopArrowNext: 12,
          marginTopArrowPrevious: 12,
          decorationDateSelected: BoxDecoration(
              color: Color.fromRGBO(25, 50, 60, 0.85),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1)),
          backgroundPicker: Color.fromRGBO(25, 50, 60, 0.85),
          backgroundActionBar: Color.fromRGBO(25, 50, 60, 0.85),
          backgroundHeaderMonth: Color.fromRGBO(25, 50, 60, 0.85),
        ),
        styleYearPicker: MaterialRoundedYearPickerStyle(
          textStyleYear: TextStyle(fontSize: 50, color: Colors.white),
          heightYearRow: 0,
        ),
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 1),
        borderRadius: 16,
      );
    });
  }
}
