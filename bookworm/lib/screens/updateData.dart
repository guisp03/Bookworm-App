import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:teste/screens/myAccount.dart';

class UpdateDataScreen extends StatefulWidget {
  @override
  _UpdateDataScreenState createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  
  dynamic image = AssetImage('assets/images/mario.jpg');
  final picker = ImagePicker();

  _imgdaCamera() async {
    final file = await picker.getImage(source: ImageSource.camera);

    setState(() {
      file != null ? image = FileImage(File(file.path)) : print('');
    });
  }

  _imgdaGaleria() async {
    final file = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      file != null ? image = FileImage(File(file.path)) : print('');
    });
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: (MediaQuery.of(context).size.width * 0.5) - 16,
                    child: CircleAvatar(
                      radius: 64.0,
                      backgroundImage: image,
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => CustomAlertDialog(
                        Column(
                          children: [
                            ClickableText(0.0, 16.0, () => _imgdaCamera(),
                                Text('Imagem da Camêra')),
                            ClickableText(0.0, 0.0, () => _imgdaGaleria(),
                                Text('Imagem da Galeria')),
                          ],
                        ),
                        'Imagem'
                      ),
                    );
                  },
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccountScreen()));
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
