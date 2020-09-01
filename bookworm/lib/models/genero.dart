import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/screens/product.dart';

class Genero {
  final int idGenero;
  final String nomeGenero;

  Genero(
    this.idGenero,
    this.nomeGenero,
  );
}

class Produto {
  final int idProduto;
  //final int TipoAcervo;
  final String nomeProduto;
  final String autores;
  final String anoEdicao;
  //final String TipoProduto;
  final String editora;
  final String descricao;
  final ImageProvider imagem;

  Produto(
    this.idProduto,
    //this.TipoAcervo,
    this.nomeProduto,
    this.autores,
    this.anoEdicao,
    //this.TipoProduto,
    this.editora,
    this.descricao,
    this.imagem,
  );
}

class GeneroProduto {
  final int idGenero;
  final int idProduto;

  GeneroProduto(
    this.idGenero,
    this.idProduto,
  );
}

class GenerosListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Produto> produtosFantasia = [
      Produto(
        1,
        "As crônicas de Nárnia \n Volume único",
        "Lewis, C. S., Campos, Paulo Mendes",
        "2009",
        "WMF \nMartins Fontes",
        "Viagens ao fim do mundo, criaturas fantásticas e batalhas épicas entre o bem e o mal - o que mais um leitor poderia querer de um livro? O livro que tem tudo isso é 'O leão, a feiticeira e o guarda-roupa', escrito em 1949 por Clive Staples Lewis. MasLewis não parou por aí. Seis outros livros vieram depois e, juntos, ficaram conhecidos como 'As crônicas de Nárnia'. Nos últimos cinqüenta anos, 'As crônicas de Nárnia' transcenderam o gênero da fantasia para se tornar parte do cânone da literaturaclássica. Cada um dos sete livros é uma obra-prima, atraindo o leitor para um mundo em que a magia encontra a realidade, e o resultado é um mundo ficcional que tem fascinado gerações. Esta edição apresenta todas as sete crônicas integralmente, num único volume. Os livros são apresentados de acordo com a ordem de preferência de Lewis, cada capítulo com uma ilustração do artista original, Pauline Baynes. Enganosamente simples e direta, 'As crônicas de Nárnia' continuam cativando os leitores com aventuras, personagens e fatos que falam a pessoas de todas as idades",
        AssetImage("assets/images/narnia.jpg"),
      ),
      Produto(
        3,
        "O Ladrao De Raios \n Percy Jackson e Os Olimpianos \n Livro Um",
        "Rick Riordan",
        "2010",
        "Intrinseca",
        "Primeiro volume da saga Percy Jackson e os olimpianos, O ladrão de raios esteve entre os primeiros lugares na lista das séries mais vendidas do The New York Times. O autor conjuga lendas da mitologia grega com aventuras no século XXI. Nelas, os deuses do Olimpo continuam vivos, ainda se apaixonam por mortais e geram filhos metade deuses, metade humanos, como os heróis da Grécia antiga. Marcados pelo destino, eles dificilmente passam da adolescência. Poucos conseguem descobrir sua identidade.O garoto-problema Percy Jackson é um deles. Tem experiências estranhas em que deuses e monstros mitológicos parecem saltar das páginas dos livros direto para a sua vida. Pior que isso: algumas dessas criaturas estão bastante irritadas. Um artefato precioso foi roubado do Monte Olimpo e Percy é o principal suspeito. Para restaurar a paz, ele e seus amigos – jovens heróis modernos – terão de fazer mais do que capturar o verdadeiro ladrão: precisam elucidar uma traição mais ameaçadora que fúria dos deuses.Best-seller da Veja",
        AssetImage("assets/images/raio.jpg"),
      ),
    ];

    List<Produto> produtosRomance = [
      Produto(
        2,
        "Orgulho e Preconceito",
        "Jane Austen",
        "2019",
        "José \n Olympio",
        'A história de um amor improvável em uma época em que sentimentos poderiam não ser suficientes. \n Quando Elizabeth Bennet conhece o cobiçado Fitzwilliam Darcy, não hesita em julgá-lo arrogante e presunçoso, afinal ele parece desprezar sua companhia, assim como a de todo mundo, demonstrando um temperamento rude e orgulhoso, impossível de agradar. Após descobrir o envolvimento do detestável cavalheiro nos eventos que separaram sua querida irmã, Jane, do jovem Bingley, Elizabeth está determinada a odiá-lo ainda mais. Uma surpreendente reviravolta, porém, poderá provar que as primeiras impressões nem sempre são incontestáveis.',
        AssetImage("assets/images/orgulho.jpg"),
      ),
      Produto(
        4,
        "A Hora da Estrela",
        "Clarice Lispector",
        "1998",
        "Rocco",
        "Entre a realidade e o delírio, buscando o social enquanto sua alma a engolfava, Clarice escreveu um livro singular. 'A Hora da Estrela' é um romance sobre o desamparo a que, apesar da linguagem, todos estamos entregues.",
        AssetImage("assets/images/estrela.jpg"),
      )
    ];

    Map<Genero, List<Produto>> map = {
      Genero(1, "Fantasia"): produtosFantasia,
      Genero(2, "Romance"): produtosRomance,
    };

    return _generosListView(map);
  }

  ListView _generosListView(data) {
    List generos = data.keys.toList();
    List listProdutos = data.values.toList();
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              Text(
                generos[i].nomeGenero,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 14,
                  bottom: 14,
                  right: 38,
                  left: 38,
                ),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listProdutos[i].length,
                    itemBuilder: (context, j) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                listProdutos[i][j].nomeProduto,
                                listProdutos[i][j].imagem,
                                listProdutos[i][j].editora,
                                listProdutos[i][j].anoEdicao,
                                "",
                                listProdutos[i][j].autores,
                                "",
                                listProdutos[i][j].descricao,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          child: Image(
                            image: listProdutos[i][j].imagem,
                            fit: BoxFit.cover,
                          ),
                          width: 130,
                          margin: EdgeInsets.only(right: 46),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        });
  }
}
