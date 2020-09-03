import 'package:flutter/cupertino.dart';

class Produto {
  final int idProduto;
  final String nome;
  final String autores;
  final String anoEdicao;
  final String tipoProduto;
  final String editora;
  final String descricao;
  final ImageProvider imagem;

  Produto(
    this.idProduto,
    this.nome,
    this.autores,
    this.anoEdicao,
    this.tipoProduto,
    this.editora,
    this.descricao,
    this.imagem,
  );
}
