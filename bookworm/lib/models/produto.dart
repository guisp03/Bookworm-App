import 'dart:ui';

class Produto{
  final int IDProduto;
  final int TipoAcervo;
  final String NomeLivro;
  final String AutoresLivro;
  final String AnoEdicao;
  final String TipoProduto;
  final String Editora;
  final String DescricaoProd;
  final Image ImagemProd;

  Produto(
      this.IDProduto,
      this.TipoAcervo,
      this.NomeLivro,
      this.AutoresLivro,
      this.AnoEdicao,
      this.TipoProduto,
      this.Editora,
      this.DescricaoProd,
      this.ImagemProd,
      );
}
