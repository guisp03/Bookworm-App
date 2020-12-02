import 'dart:async';
import 'package:flutter/material.dart';
import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'dart:io' as Io;

class Leitor {
  final int idLeitor;
  final String tipoLeitor;
  final String nome;
  final String dataNasc;
  final String endereco;
  final String telefone;
  final String email;
  final String imagemLeitor;
  final String rg;
  final String cpf;
  final String dataCadastro;
  final List<int> favoritos;
  final List<ReservaLeitor> reservas;

  Leitor(
      this.idLeitor,
      this.tipoLeitor,
      this.nome,
      this.dataNasc,
      this.endereco,
      this.telefone,
      this.email,
      this.imagemLeitor,
      this.rg,
      this.cpf,
      this.dataCadastro,
      this.favoritos,
      this.reservas);

  Leitor.fromJson(Map<String, dynamic> json)
      : idLeitor = json['IDLeitor'],
        tipoLeitor = json['TipoLeitor'],
        nome = json['Nome'],
        dataNasc = json['DataNasc'],
        endereco = json['Endereco'],
        telefone = json['Telefone'],
        email = json['Email'],
        imagemLeitor = json['ImagemLeitor'],
        rg = json['RG'],
        cpf = json['CPF'],
        dataCadastro = json['DataCadastro'],
        favoritos = json['Favoritos'].cast<int>(),
        reservas = json['Reservas']
            .map((e) => ReservaLeitor.fromJson(e))
            .toList()
            .cast<ReservaLeitor>();

  Map<String, dynamic> toJson() => {
        'IDLeitor': idLeitor,
        'TipoLeitor': tipoLeitor,
        'Nome': nome,
        'DataNasc': dataNasc,
        'Endereco': endereco,
        'Telefone': telefone == null
            ? telefone
            : telefone
                .replaceAll('(', '')
                .replaceAll(')', '')
                .replaceAll('-', ''),
        'Email': email,
        'RG': rg == null ? rg : rg.replaceAll(".", "").replaceAll("-", ""),
        'CPF': cpf == null ? cpf : cpf.replaceAll(".", "").replaceAll("-", ""),
        'ImagemLeitor': imagemLeitor,
        //'Favoritos': favoritos.asMap(),
        'Reservas': jsonEncode(reservas)
      };
}

class ReservaLeitor {
  final int idReserva;
  final int idProduto;

  ReservaLeitor(this.idReserva, this.idProduto);

  ReservaLeitor.fromJson(Map<String, dynamic> json)
      : idProduto = json['IDProduto'],
        idReserva = json['IDReserva'];

  Map<String, dynamic> toJson() => {
        'IDProduto': idProduto,
        'IDReserva': idReserva,
      };
}

class Resultado {
  final int code;
  final String message;

  Resultado(this.code, this.message);

  Resultado.fromJson(Map<String, dynamic> json)
      : code = json['Code'],
        message = json['Message'];
}

class LeitorWeb {
  Future<Leitor> getLeitor(int id) async {
    final Response response = await client.get(baseUrl + 'leitor?id=$id');
    return Leitor.fromJson(jsonDecode(response.body));
  }

  Future<Resultado> putLeitor(int id, Leitor leitor) async {
    final Response response = await client.put(baseUrl + 'leitor?id=$id',
        headers: {"content-type": "text/json"},
        body: jsonEncode(leitor.toJson()));
    if (response.body.isEmpty) {
      return Resultado(200, 'Ok');
    } else {
      return Resultado.fromJson(jsonDecode(response.body));
    }
  }
}

class Favoritos {
  Future<Resultado> putFavoritos(int id, List<int> favoritos) async {
    final Response response = await client.put(
      baseUrl + 'leitor/$id/favoritos',
      headers: {"content-type": "application/json"},
      body: [1,2,3]);
      if (response.body.isEmpty) {
        return Resultado(200, 'Ok');
      } else {
        return Resultado.fromJson(jsonDecode(response.body));
      }
  }
}

class Token {
  final String idLeitor;
  final int nbf;
  final int exp;
  final int iat;

  Token(
    this.idLeitor,
    this.nbf,
    this.exp,
    this.iat,
  );

  Token.fromJson(Map<String, dynamic> json)
      : idLeitor = json['UserId'],
        nbf = json['nbf'],
        exp = json['exp'],
        iat = json['iat'];
}

class Login {
  final int code;
  final String token;

  Login(this.code, this.token);

  Login.fromJson(Map<String, dynamic> json)
      : code = json['Code'],
        token = json['Token'];
}

class LoginWeb {
  Future<Login> logar(String email, String senha) async {
    Response response = await client.post(baseUrl + "login",
        headers: {"content-type": "text/json"},
        body: jsonEncode(<String, String>{"email": email, "senha": senha}));
    if (response.statusCode == 200) {
      return Login.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao realizar login!');
    }
  }
}
