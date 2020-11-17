import 'package:flutter/material.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';

class SacScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'SAC',
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                right: 24.0,
                left: 24.0,
              ),
              child: RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                    text:
                        "Tem alguma dúvida, elogio ou reclamação? Manda pra gente!",
                    style: Theme.of(context).textTheme.subtitle1),
              ),
            ),
            CustomTextField(
                Theme.of(context).textTheme.subtitle1,
                false,
                Color.fromRGBO(170, 187, 2014, 0.9),
                'Email',
                Theme.of(context).textTheme.subtitle1,
                null,
                null,
                null
                ),
            Container(
              height: 300.0,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 24.0,
                  bottom: 24.0,
                  right: 48.0,
                  left: 48.0,
                ),
                child: TextField(
                  style: Theme.of(context).textTheme.subtitle1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(170, 187, 2014, 0.9),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    hintText: "Recado",
                    hintStyle: Theme.of(context).textTheme.subtitle1,
                  ),
                  maxLines: 20,
                ),
              ),
            ),
            ClickableText(
              8.0,
              16.0,
              () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => CustomAlertDialog(Text(
                        "Pronto! Seu recado foi enviado. \n\nA gente promete te responder o mais rápido possível ;)")));
              },
              TextWithIcon(
                AssetImage("assets/images/enviar.png"),
                Text(
                  'Enviar',
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
