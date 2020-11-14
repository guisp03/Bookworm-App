import 'package:flutter/material.dart';
import 'package:teste/components/pageModelInside.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageModelInsideScreen(
      'Sobre',
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: 'Olá! Somos um grupo de alunos do último ano do ETIM em informática na Escola Técnica Estadual de São Paulo! Escolhemos desenvolver esse sistema de biblioteca como projeto para o nosso TCC, usando como inspiração as maiores bibliotecas públicas de São Paulo. Em nossas plataformas procuramos trazer mais facilidade para a vida dos funcionários e conveniados da biblioteca, por meio da automatização dos protocolos burocráticos e da humanização da relação livro/leitor, inserindo assim recomendações mais cuidadosas, mapas literários mais precisos, entre outras coisas. Esperamos que você, visitante, tenha uma ótima experiência na BOOKWORM. Caso tenha reclamações, sugestões ou dúvidas, entre em contato conosco pelo (inserir aqui a forma de contato)',
          style: Theme.of(context).textTheme.subtitle1
        ),
      ),
    );
  }
}
