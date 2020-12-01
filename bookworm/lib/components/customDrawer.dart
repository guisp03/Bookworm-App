import 'package:flutter/material.dart';
import 'package:teste/components/clickableIcon.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:teste/models/produto.dart';
import 'package:teste/screens/aboutUs.dart';
import 'package:teste/screens/events.dart';
import 'package:teste/screens/login.dart';
import 'package:teste/screens/myAccount.dart';
import 'package:teste/screens/productsList.dart';
import 'package:teste/util/resize.dart';
import 'clickableText.dart';
import 'package:teste/models/leitor.dart';

class CustomDrawer extends StatelessWidget {
  final int id;

  const CustomDrawer(this.id);

  @override
  Widget build(BuildContext context) {
    LeitorWeb leitorWeb = new LeitorWeb();
    Leitor leitor;
    Resize resize = new Resize();
    resize.getWidthAndHeight(context);
    return FutureBuilder<Leitor>(
      future: leitorWeb.getLeitor(id),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              leitor = snapshot.data;
              return Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      height: resize.getHeight(110.0),
                      child: DrawerHeader(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 24.0,
                              backgroundImage: leitor.imagemLeitor,
                            ),
                            Text(
                              "Olá",
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            ClickableIcon(() {
                              Navigator.pop(context);
                            }, AssetImage("assets/images/livrosmenu.png"),
                                resize.getWidth(36.0)),
                          ],
                        ),
                      ),
                    ),
                    _drawerItems(
                      context,
                      "Acervo",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProductListScreen(leitor.idLeitor)));
                      },
                    ),
                    _drawerItems(
                      context,
                      'Eventos',
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EventsScreen(leitor.idLeitor)));
                      },
                    ),
                    _drawerItems(
                      context,
                      'Minha Conta',
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyAccountScreen(leitor.idLeitor)));
                      },
                    ),
                    _drawerItems(
                      context,
                      'Sobre',
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AboutUsScreen(leitor.idLeitor)));
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
                                        resize.getHeight(16.0),
                                        0.0,
                                        () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()),
                                                  (route) => false);
                                        },
                                        TextWithIcon(
                                          AssetImage("assets/images/sair.png"),
                                          Text(
                                            "Sair",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              'Saída'),
                        );
                      },
                    ),
                  ],
                ),
              );
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
