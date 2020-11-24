import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:teste/screens/updateData.dart';

class MyAccountScreen extends StatefulWidget {
  final String nome;
  final String cpf;
  final String rg;
  final String dataNasc;
  final String endereco;
  final String telefone;
  final String email;
  final String senha;
  final dynamic imagem;

  const MyAccountScreen(
    this.nome,
    this.cpf,
    this.rg,
    this.dataNasc,
    this.endereco,
    this.telefone,
    this.email,
    this.senha,
    this.imagem,
  );

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: (MediaQuery.of(context).size.width * 0.5) - 16,
                  child: CircleAvatar(
                    radius: 64.0,
                    backgroundImage: widget.imagem,
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width * 0.5) - 16,
                  child: Text(widget.nome,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            _userInformation(context, "CPF: " + widget.cpf),
            _userInformation(context, "RG: " + widget.rg),
            _userInformation(context, "Data de Nascimento: " + widget.dataNasc),
            _userInformation(
                context, "Endereço: " + widget.endereco),
            _userInformation(context, "Telefone: " + widget.telefone),
            _userInformation(context, "Email: " + widget.email),
            _userInformation(context, "Senha: " + widget.senha),
            ClickableText(
              16.0,
              8.0,
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateDataScreen()));
              },
              TextWithIcon(
                AssetImage("assets/images/reservar.png"),
                Text(
                  'Editar Dados',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
