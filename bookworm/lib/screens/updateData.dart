import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:teste/screens/myAccount.dart';

class UpdateDataScreen extends StatelessWidget {
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
                  child: Column(
                    children: [
                      Text(
                        'Nome: ',
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.center,
                      ),
                      TextField(),
                    ],
                  ),
                ),
              ],
            ),
            _userInformation(context, "CPF: "),
            TextField(),
            _userInformation(context, "RG: "),
            TextField(),
            _userInformation(context, "Data de Nascimento: "),
            TextField(),
            _userInformation(context, "Endereço: "),
            TextField(),
            _userInformation(context, "Telefone: "),
            TextField(),
            _userInformation(context, "Email: "),
            TextField(),
            _userInformation(context, "Senha: "),
            TextField(),
            ClickableText(
              16.0,
              8.0,
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyAccountScreen()));
              },
              TextWithIcon(
                AssetImage("assets/images/reservar.png"),
                Text(
                  'Confirmar Dados',
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
