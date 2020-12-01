import 'dart:io';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/pageModelInside.dart';
import 'package:teste/components/textWithIcon.dart';
import 'package:teste/models/leitor.dart';
import 'package:teste/screens/myAccount.dart';

class UpdateDataScreen extends StatefulWidget {
  final int id;
  final String nome;
  final String cpf;
  final String rg;
  final String dataNasc;
  final String endereco;
  final String telefone;
  final String email;
  final ImageProvider imagem;
  final String tipoLeitor;
  final String dataCadastro;
  final List<Favoritos> favoritos;
  final List<ReservaLeitor> reservas;

  const UpdateDataScreen(
      this.id,
      this.nome,
      this.cpf,
      this.rg,
      this.dataNasc,
      this.endereco,
      this.telefone,
      this.email,
      this.imagem,
      this.tipoLeitor,
      this.dataCadastro, this.favoritos, this.reservas);

  @override
  _UpdateDataScreenState createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _rgController = TextEditingController();
  final TextEditingController _dataNascController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final maskCpf = new MaskTextInputFormatter(mask: '###.###.###-##');
  final maskRg = new MaskTextInputFormatter(mask: '##.###.###-##');
  final maskData = new MaskTextInputFormatter(mask: '##/##/####');

  LeitorWeb leitorWeb = new LeitorWeb();
  Leitor leitor;
  
  dynamic image;
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
                            'Imagem'),
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
                        TextField(
                          controller: _nomeController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _userInformation(context, "CPF: "),
              TextField(
                controller: _cpfController,
                inputFormatters: [maskCpf],
              ),
              _userInformation(context, "RG: "),
              TextField(
                controller: _rgController,
                inputFormatters: [maskRg],
              ),
              _userInformation(context, "Data de Nascimento: "),
              TextField(
                controller: _dataNascController,
                inputFormatters: [maskData],
              ),
              _userInformation(context, "Endereço: "),
              TextField(
                controller: _enderecoController,
              ),
              _userInformation(context, "Telefone: "),
              TextField(
                controller: _telefoneController,
              ),
              _userInformation(context, "Email: "),
              TextField(
                controller: _emailController,
              ),
              ClickableText(
                16.0,
                8.0,
                () {
                  if (_nomeController.text.isNotEmpty &&
                      _cpfController.text.isNotEmpty &&
                      _rgController.text.isNotEmpty &&
                      _dataNascController.text.isNotEmpty &&
                      _enderecoController.text.isNotEmpty &&
                      _telefoneController.text.isNotEmpty &&
                      _emailController.text.isNotEmpty) {
                    if (CPF.isValid(_cpfController.text)) {
                      leitor = new Leitor(
                        widget.id,
                        widget.tipoLeitor,
                        _nomeController.text,
                        _dataNascController.text,
                        _enderecoController.text,
                        _telefoneController.text,
                        _emailController.text,
                        image,
                        _rgController.text,
                        _cpfController.text,
                        widget.dataCadastro,
                        widget.favoritos,
                        widget.reservas
                      );
                       leitorWeb.putLeitor(widget.id, leitor).catchError((e) =>
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => CustomAlertDialog(Text(
                                  'Erro ao atualizar dados!\nTente novamente!'))));
                                  
                    } else {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) =>
                              CustomAlertDialog(Text('CPF Inválido')));
                    }
                  } else {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            CustomAlertDialog(Text('Algum campo está vazio!')));
                  }

                 // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(
                       //   builder: (context) => MyAccountScreen(widget.id)));
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
        widget.id);
  }
}
