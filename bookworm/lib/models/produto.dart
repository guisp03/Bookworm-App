import 'package:flutter/cupertino.dart';

class Produto {
  final int idProduto;
  //final int TipoAcervo;
  final String nome;
  final String autores;
  final String anoEdicao;
  //final String TipoProduto;
  final String editora;
  final String descricao;
  final ImageProvider imagem;

  Produto(
    this.idProduto,
    //this.TipoAcervo,
    this.nome,
    this.autores,
    this.anoEdicao,
    //this.TipoProduto,
    this.editora,
    this.descricao,
    this.imagem,
  );
}

class ProdutoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Produto> produtos = [
      Produto(
        1,
        "As crônicas de Nárnia - volume único",
        "	Lewis, C. S., Campos, Paulo Mendes",
        "2009",
        "WMF Martins Fontes",
        "Viagens ao fim do mundo, criaturas fantásticas e batalhas épicas entre o bem e o mal - o que mais um leitor poderia querer de um livro? O livro que tem tudo isso é 'O leão, a feiticeira e o guarda-roupa', escrito em 1949 por Clive Staples Lewis. MasLewis não parou por aí. Seis outros livros vieram depois e, juntos, ficaram conhecidos como 'As crônicas de Nárnia'. Nos últimos cinqüenta anos, 'As crônicas de Nárnia' transcenderam o gênero da fantasia para se tornar parte do cânone da literaturaclássica. Cada um dos sete livros é uma obra-prima, atraindo o leitor para um mundo em que a magia encontra a realidade, e o resultado é um mundo ficcional que tem fascinado gerações. Esta edição apresenta todas as sete crônicas integralmente, num único volume. Os livros são apresentados de acordo com a ordem de preferência de Lewis, cada capítulo com uma ilustração do artista original, Pauline Baynes. Enganosamente simples e direta, 'As crônicas de Nárnia' continuam cativando os leitores com aventuras, personagens e fatos que falam a pessoas de todas as idades",
        AssetImage("assets/images/narnia.jpg"),
      ),
      Produto(
        2,
        "Orgulho e Preconceito",
        " Jane Austen",
        "2019",
        "José Olympio",
        'A história de um amor improvável em uma época em que sentimentos poderiam não ser suficientes. \n Quando Elizabeth Bennet conhece o cobiçado Fitzwilliam Darcy, não hesita em julgá-lo arrogante e presunçoso, afinal ele parece desprezar sua companhia, assim como a de todo mundo, demonstrando um temperamento rude e orgulhoso, impossível de agradar. Após descobrir o envolvimento do detestável cavalheiro nos eventos que separaram sua querida irmã, Jane, do jovem Bingley, Elizabeth está determinada a odiá-lo ainda mais. Uma surpreendente reviravolta, porém, poderá provar que as primeiras impressões nem sempre são incontestáveis.',
        AssetImage("assets/images/orgulho.jpg"),
      ),
      Produto(
        3,
        "",
        "",
        "",
        "",
        "",
        AssetImage(null),
      ),
      Produto(
        4,
        "",
        "",
        "",
        "",
        "",
        AssetImage(null),
      ),
    ];
    return null;
  }
}
