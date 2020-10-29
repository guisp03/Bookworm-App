import 'package:flutter/material.dart';
import 'package:teste/components/clickableIcon.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:teste/screens/aboutUs.dart';
import 'package:teste/screens/events.dart';
import 'package:teste/screens/home.dart';
import 'package:teste/screens/login.dart';
import 'package:teste/screens/myAccount.dart';
import 'package:teste/screens/productsList.dart';
import 'package:teste/screens/sac.dart';
import 'package:teste/screens/supportUs.dart';

import 'clickableText.dart';

class CustomDrawer extends StatelessWidget {
  final String title;

  const CustomDrawer({this.title});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 110.0,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage("assets/images/mario.jpg"),
                  ),
                  Text(
                    "Olá",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  ClickableIcon(() {
                    Navigator.pop(context);
                  }, AssetImage("assets/images/livrosmenu.png"), 36.0),
                ],
              ),
            ),
          ),
          _drawerItems(
            context,
            "Início",
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          _drawerItems(
            context,
            "Acervo",
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()));
            },
          ),
          _drawerItems(
            context,
            'Eventos',
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventsScreen()));
            },
          ),
          _drawerItems(
            context,
            'Minha Conta',
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccountScreen()));
            },
          ),
          _drawerItems(
            context,
            'Apoie',
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SupportUsScreen()));
            },
          ),
          _drawerItems(
            context,
            'Sobre',
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()));
            },
          ),
          _drawerItems(
            context,
            'SAC',
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SacScreen()));
            },
          ),
          _drawerItems(
            context,
            "Sair",
            () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => CustomAlertDialog(
                  Column(
                    children: <Widget>[
                      Text(
                        "Poxa, já está de saída? :( \n\nEstaremos te esperando, por isso, volte logo!",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClickableText(
                            16.0,
                            0.0,
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            TextWithIcon(
                              AssetImage("assets/images/sair.png"),
                              Text(
                                "Sair",
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

ListTile _drawerItems(BuildContext context, String title, Function onClick) {
  return ListTile(
    title: Text(
      title,
      style: Theme.of(context).textTheme.subtitle1,
      textAlign: TextAlign.center,
    ),
    onTap: () => onClick(),
  );
}
