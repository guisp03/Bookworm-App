import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CustomCalendar extends StatefulWidget {

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.only(bottom: 10),
          height: 295,
          width: 380,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Color.fromRGBO(229, 229, 229, 0.5)
                ),
            ),
          ),
          child: TableCalendar(
            locale: 'pt_BR',
            calendarStyle: CalendarStyle(
              todayColor: Colors.transparent,
              selectedColor: Colors.transparent,
              todayStyle: TextStyle(
                fontSize: 20,
              ),
              selectedStyle: TextStyle(
                fontSize: 20,
              ),
              weekendStyle: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
              weekdayStyle: TextStyle(
                fontSize: 20,
              ),
              outsideStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(229, 229, 229, 0.5)
              ),
              outsideWeekendStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(229, 229, 229, 0.5),
              )
            ),
            headerStyle: HeaderStyle(
              titleTextBuilder: (date, locale) => DateFormat.MMMM(locale).format(date).toLowerCase(),
              centerHeaderTitle: true,
              titleTextStyle: Theme.of(context).textTheme.subtitle1,
              formatButtonVisible: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle().copyWith(color: Colors.white),
              dowTextBuilder: (date, locale) => DateFormat.E(locale).format(date)[0],
            ),
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) =>
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      ),
                      child: Text(date.day.toString(), style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      ),
                    ),
              dowWeekdayBuilder: (context, date) =>
                  Container(
                    alignment: Alignment.center,
                    child: Text(date.toString().toUpperCase(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    ),
                  ),
              dowWeekendBuilder: (context, date) =>
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.zero,
                    child: Text( date.toString().toUpperCase(), style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    ),
                  ),
                  ),

            calendarController: _controller,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(158, 44, 74, 0.8),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1
                      )
                    )
                    ),
                  Text(
                    'Livro reservado',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(233, 215, 88, 0.8),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 1
                        )
                    )
                ),
                Text(
                  'Pode ocorrer a renovação',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 252, 252, 0.8),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 1
                        )
                    )
                ),
                Text(
                  'Livro disponível',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
                ]
            ),
          ],
        );
  }
}
