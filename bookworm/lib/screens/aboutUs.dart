import 'package:flutter/material.dart';
import 'package:teste/components/pageModelInside.dart';

class AboutUsScreen extends StatelessWidget {
  final int id;

  const AboutUsScreen(this.id);
  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'Sobre',
      SingleChildScrollView(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text:
                    'Olá! Somos um grupo de alunos do último ano do ETIM em informática na Escola Técnica Estadual de São Paulo! \nEscolhemos desenvolver esse sistema de biblioteca como projeto para o nosso TCC, usando como inspiração as maiores bibliotecas públicas de São Paulo. \nEm nossas plataformas procuramos trazer mais facilidade para a vida dos funcionários e conveniados da biblioteca, por meio da automatização dos protocolos burocráticos e da humanização da relação livro/leitor, inserindo assim recomendações mais cuidadosas, mapas literários mais precisos, entre outras coisas.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: (MediaQuery.of(context).size.width * 0.5) - 16,
                    child: Image.asset(
                      'assets/images/ratinhocha.png',
                      fit: BoxFit.cover,
                    )),
                Container(
                  width: (MediaQuery.of(context).size.width * 0.5) - 16,
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text:
                          '\nEsperamos que você, visitante, tenha uma ótima experiência na BOOKWORM ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text:
                      'Caso tenha reclamações ou dúvidas, entre em contato conosco pelo nosso email: bookworm@email.com',
                  style: Theme.of(context).textTheme.subtitle1),
            ),
          ],
        ),
      ),
      id,
    );
  }
}
