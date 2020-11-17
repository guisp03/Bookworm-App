import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:teste/screens/updateData.dart';

class MyAccountScreen extends StatelessWidget {
  
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
                    backgroundImage: AssetImage("assets/images/mario.jpg"),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width * 0.5) - 16,
                  child: Text("Guilherme Sousa Panza",
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center),
                ),
              ],
            ),
            _userInformation(context, "CPF: XXXXX"),
            _userInformation(context, "RG: XXXXX"),
            _userInformation(context, "Data de Nascimento: DD/MM/AA"),
            _userInformation(
                context, "Endereço: Rua Tal, e blah blahllllllllllll blah"),
            _userInformation(context, "Telefone: Varios npumeors ae"),
            _userInformation(context, "Email: Email@email.com.br"),
            _userInformation(context, "Senha: ********"),
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
