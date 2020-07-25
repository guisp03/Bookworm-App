import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      "Minha Conta",
      Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    radius: 64.0,
                    backgroundImage: AssetImage("assets/images/mario.jpg"),
                  ),
                  Text(
                    "Fulano de Tal",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
              _productInformation(context, "ID: XXXXX"),
              _productInformation(context, "CPF: XXXXX"),
              _productInformation(context, "RG: XXXXX"),
              _productInformation(context, "Data de Nascimento: DD/MM/AA"),
              _productInformation(
                  context, "Endereço: Rua Tal, e blah blah blah"),
              _productInformation(context, "Telefone: Varios npumeors ae"),
              _productInformation(context, "Email: Email@email.com.br"),
              _productInformation(context, "Senha: ********"),
              ClickableText(
                16.0,
                8.0,
                () {},
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
                () {},
                TextWithIcon(
                  AssetImage("assets/images/reservar.png"),
                  Text(
                    'Trocar Senha',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Padding _productInformation(BuildContext context, String information) {
  return Padding(
    padding: EdgeInsets.only(top: 16.0),
    child: Text(
      information,
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}
