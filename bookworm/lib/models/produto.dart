import 'package:flutter/cupertino.dart';
import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Produto {
  final int idProduto;
  final String isbn;
  final String nome;
  final String autores;
  final String anoEdicao;
  final String tipoProduto;
  final int tipoAcervo;
  final String editora;
  final String descricao;
  final ImageProvider imagem;
  final List<String> generos;
  final List<dynamic> reservas;
  final int setor;
  final int prateleira;
  final int fileira;

  Produto(
      this.idProduto,
      this.isbn,
      this.nome,
      this.autores,
      this.anoEdicao,
      this.tipoProduto,
      this.tipoAcervo,
      this.editora,
      this.descricao,
      this.imagem,
      this.generos,
      this.reservas,
      this.setor,
      this.prateleira,
      this.fileira);

  Produto.fromJson(Map<String, dynamic> json)
      : idProduto = json['IDProduto'],
        isbn = json['ISBN'],
        nome = json['NomeLivro'],
        autores = json['AutoresLivro'],
        anoEdicao = json['AnoEdicao'],
        tipoProduto = json['TipoProduto'],
        tipoAcervo = json['TipoAcervo'],
        editora = json['Editora'],
        descricao = json['DescricaoProd'],
        imagem = MemoryImage(base64.decode(json['ImagemProd'])),
        generos = json['Generos'].cast<String>(),
        reservas = json['Reservas'],
        setor = json['Setor'],
        prateleira = json['Prateleira'],
        fileira = json['Fileira'];
}

class ProdutoWeb {
  final int totalCount;
  final int count;
  final List<Produto> produtos;

  ProdutoWeb(
    this.totalCount,
    this.count,
    this.produtos,
  );

  ProdutoWeb.fromJson(Map<String, dynamic> json)
      : totalCount = json['total_count'],
        count = json['count'],
        produtos =
            (json['produtos'] as List).map((e) => Produto.fromJson(e)).toList();
}

class ProdutoClienteWeb {
  Future<ProdutoWeb> getProdutoWeb(int page) async {
    final Response response = await client.get(
        "http://192.168.0.9:45455/produtos?page=$page&count=20");
    if (response.statusCode == 200) {
      return ProdutoWeb.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao buscar produtos!');
    }
  }
}
