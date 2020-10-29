import 'package:flutter/material.dart';
import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Produto {
  final int idProduto;
  final String nome;
  final String autores;
  final String anoEdicao;
  final String tipoProduto;
  final String editora;
  final String descricao;
  final ImageProvider imagem;

  Produto(this.idProduto, this.nome, this.autores, this.anoEdicao,
      this.tipoProduto, this.editora, this.descricao, this.imagem);

  /*Produto.fromJson(Map<String, dynamic> json)
      : idProduto = json['idProduto'],
        nome = json['nome'],
        autores = json['autores'],
        anoEdicao = json['anoEdicao'],
        tipoProduto = json['tipoProduto'],
        editora = json['editora'],
        descricao = json['descricao'],
        imagem = json['imagem'];

  Map<String, dynamic> toJson() => {
        'idProduto': idProduto,
        'nome': nome,
        'autores': autores,
        'anoEdicao': anoEdicao,
        'tipoProduto': tipoProduto,
        'editora': editora,
        'descricao': descricao,
        'imagem': imagem,
      };

  Future<Produto> getProduto() async {
    final Response response = await client.get(baseUrl);
    return Produto.fromJson(jsonDecode(response.body));
  }

  Future<Produto> putProduto(Produto produto) async {
    final Response response = await client.put(baseUrl, body: produto);
    return Produto.fromJson(jsonDecode(response.body));
  }

  Future<List<Produto>> getProdutos() async {
    final Response response =
        await client.get("https://192.168.0.9:45456/produtos");
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Produto.fromJson(json)).toList();
  }*/
}

class ProdutoWeb {
  final int totalCount;
  final int count;
  final List<dynamic> produtos;

  ProdutoWeb(
    this.totalCount,
    this.count,
    this.produtos,
  );

  ProdutoWeb.fromJson(Map<String, dynamic> json)
      : totalCount = json['total_count'],
        count = json['count'],
        produtos = json['produtos'];
}

class ProdutoClienteWeb {
  Future<ProdutoWeb> getProdutoWeb() async {
    final Response response =
        await client.get("http://192.168.0.9:45455/produtos");
    return ProdutoWeb.fromJson(jsonDecode(response.body));
  }
}
