import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:teste/models/leitor.dart';
import 'package:teste/screens/favorites.dart';
import 'package:teste/screens/updateData.dart';
import 'dart:convert';

class MyAccountScreen extends StatefulWidget {
  final int id;

  const MyAccountScreen(
    this.id,
  );

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  LeitorWeb leitorWeb = new LeitorWeb();
  Future<Leitor> future;
  Leitor leitor;

  @override
  void initState() {
    super.initState();
    future = leitorWeb.getLeitor(widget.id);
  }

  Padding _userInformation(BuildContext context, String information) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(
        information,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
        "Minha Conta",
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
                          child: Image.asset(
                              'assets/images/ratinhoprateleira.png'),
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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width * 0.5) -
                                        16,
                                child: CircleAvatar(
                                  radius: 64.0,
                                  backgroundImage: MemoryImage(
                                      base64.decode(leitor.imagemLeitor)),
                                ),
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width * 0.5) -
                                        16,
                                child: Text(leitor.nome,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                          _userInformation(
                              context,
                              "CPF: " +
                                  leitor.cpf.substring(0, 3) +
                                  '.' +
                                  leitor.cpf.substring(3, 6) +
                                  '.' + leitor.cpf.substring(6, 9) + '-' + leitor.cpf.substring(9, 11)),
                          _userInformation(context, "RG: " + leitor.cpf.substring(0,2) + '.' + leitor.cpf.substring(2,5) + "." + leitor.cpf.substring(5,8) + "-" + leitor.cpf.substring(8, 10)),
                          _userInformation(context,
                              "Data de Nascimento: " + leitor.dataNasc.substring(0,10).split('-').reversed.join().substring(0,2) + "/" + leitor.dataNasc.substring(0,10).split('-').reversed.join().substring(2,4) + '/' + leitor.dataNasc.substring(0,10).split('-').reversed.join().substring(4,8)),
                          _userInformation(
                              context, "Endereço: " + leitor.endereco),
                          _userInformation(
                              context, "Telefone: " + leitor.telefone),
                          _userInformation(context, "Email: " + leitor.email),
                          ClickableText(
                            16.0,
                            8.0,
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateDataScreen(
                                          widget.id,
                                          leitor.nome,
                                          leitor.cpf,
                                          leitor.rg,
                                          leitor.dataNasc,
                                          leitor.endereco,
                                          leitor.telefone,
                                          leitor.email,
                                          leitor.tipoLeitor,
                                          leitor.dataCadastro,
                                          leitor.favoritos,
                                          leitor.reservas)));
                            },
                            TextWithIcon(
                              AssetImage("assets/images/reservar.png"),
                              Text(
                                'Editar Dados',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                          ClickableText(
                            16.0,
                            8.0,
                            () {
                              leitor.favoritos
                                  .forEach((element) => print(element));
                              leitor.reservas
                                  .forEach((element) => print(element));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FavoritesScreen(
                                          widget.id, leitor.favoritos)));
                            },
                            TextWithIcon(
                              AssetImage("assets/images/favp.png"),
                              Text(
                                'Favoritos',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        ],
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
              }),
        ),
        widget.id);
  }
}
