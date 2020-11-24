import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teste/components/clickableText.dart';
import 'package:teste/components/customAlertDialog.dart';
import 'package:teste/components/customTextField.dart';
import 'package:teste/components/outsideButton.dart';
import 'package:teste/components/pageModelOutside.dart';
import 'package:teste/main.dart';
import 'package:teste/models/leitor.dart';
import 'package:teste/screens/forgotMyPassword.dart';
import 'package:teste/screens/productsList.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  LoginWeb login = new LoginWeb();
  Login logar;

  double verificarOrientacao(double font) {
    return MediaQuery.of(context).orientation == Orientation.portrait ? font : font * 1.5;
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(412, 732), allowFontScaling: false);
    return PageModelOutside(
        80.0.h,
        "Login",
        verificarOrientacao(88.h),
        Column(
          children: <Widget>[
            CustomTextField(
                TextStyle(
                  fontSize: verificarOrientacao(30.0.h),
                  height: 1.h,
                ),
                false,
                Color.fromRGBO(25, 50, 60, 0.85),
                'Email',
                TextStyle(
                  color: Color.fromRGBO(252, 252, 252, 1),
                ),
                null,
                _emailController,
                null
                ),
            CustomTextField(
                TextStyle(
                  fontSize: verificarOrientacao(30.0.h),
                  height: 1.h,
                ),
                true,
                Color.fromRGBO(25, 50, 60, 0.85),
                'Senha',
                TextStyle(
                  color: Color.fromRGBO(252, 252, 252, 1),
                ),
                null,
                _senhaController,
                null
                ),
            ClickableText(
              0.0,
              0.0,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotMyPasswordScreen(),
                  ),
                );
              },
              Text(
                'Esqueci a minha senha',
                style: TextStyle(
                  fontSize: verificarOrientacao(20.0.h),
                  color: BookwormApp.darkBlue,
                ),
              ),
            ),
            OutsideButton(
              () async {
                if (_emailController.text.isNotEmpty &&
                    _senhaController.text.isNotEmpty) {
                  logar = await login
                      .logar(_emailController.text, _senhaController.text)
                      .catchError((e) => showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => CustomAlertDialog(Text(
                              'Erro ao realizar login! Tente novamente!'))));
                  if (logar.code == 200) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductListScreen()));
                  } else {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            CustomAlertDialog(Text('Senha incorreta!')));
                  }
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) =>
                          CustomAlertDialog(Text('Algum campo está vazio!')));
                }
              },
              'Entrar',
              80.0.w,
            ),
          ],
        ),);
  }
}
