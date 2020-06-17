import 'package:flutter/material.dart';
import 'package:teste/screens/aboutUs.dart';
import 'package:teste/screens/productsList.dart';
import 'package:teste/screens/supportUs.dart';

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
            height: 80.0,
            child: DrawerHeader(
              child: Text(
                'Olá',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          CustomListTile(
            title: "Início",
            onClick: () {},
          ),
          CustomListTile(
            title: "Acervo",
            onClick: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScreen()));
            },
          ),
          CustomListTile(
            title: 'Eventos',
            onClick: () {},
          ),
          CustomListTile(
            title: 'Minha Conta',
            onClick: () {},
          ),
          CustomListTile(
            title: 'Apoie',
            onClick: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SupportUsScreen()));
            },
          ),
          CustomListTile(
            title: 'Sobre',
            onClick: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
            },
          ),
          CustomListTile(
            title: 'SAC',
            onClick: () {},
          ),
          CustomListTile(
            title: "Sair",
            onClick: () {},
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final Function onClick;

  const CustomListTile({
    @required this.title,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
      onTap: () => onClick(),
    );
  }
}
