import 'dart:async';
import 'package:flutter/material.dart';
import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Leitor {
  final int idLeitor;
  final String tipoLeitor;
  final String nome;
  final String dataNasc;
  final String endereco;
  final String telefone;
  final String email;
  final ImageProvider imagemLeitor;
  final String rg;
  final String cpf;
  final String dataCadastro;
  final List<Favoritos> favoritos;
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
        dataNasc = json[
            'DataNasc'],//.substring(0,10).split('-').reversed.join().substring(0,2) + "/" + json['DataNasc'].substring(0,10).split('-').reversed.join().substring(2, 4) + "/" + json['DataNasc'].substring(0,10).split('-').reversed.join().substring(4,8),
        endereco = json['Endereco'],
        telefone = json['Telefone'],
        email = json['Email'],
        imagemLeitor = MemoryImage(base64.decode(json['ImagemLeitor'])),
        rg = json['RG'],
        cpf = json['CPF'],
        dataCadastro = json['DataCadastro'],
        favoritos =
            json['Favoritos'].map((e) => Favoritos.fromJson(e)).toList().cast<Favoritos>(),
        reservas =
            json['Reservas'].map((e) => ReservaLeitor.fromJson(e)).toList().cast<ReservaLeitor>();


  Map<String, dynamic> toJson() => {
        'IdLeitor': idLeitor,
        'TipoLeitor': tipoLeitor,
        'Nome': nome,
        'DataNasc': dataNasc,
        'Endereco': endereco,
        'Telefone': telefone,
        'Email': email,
        'ImagemLeitor': imagemLeitor,
        'RG': rg,
        'CPF': cpf,
        'DataCadastro': dataCadastro,
        'Favoritos': favoritos,
        'Reservas': reservas
      };
}

class ReservaLeitor {
  final int idReserva;
  final int idProduto;

  ReservaLeitor(this.idReserva, this.idProduto);

  ReservaLeitor.fromJson(Map<String, dynamic> json)
      : idProduto = json['IDProduto'],
        idReserva = json['IDReserva'];
}

class Favoritos {
  final int idProduto;

  Favoritos(this.idProduto);

  Favoritos.fromJson(Map<String, dynamic> json) : idProduto = json['IDProduto'];
}

class LeitorWeb {
  Future<Leitor> getLeitor(int id) async {
    final Response response = await client.get(baseUrl + 'leitor?id=$id');
    return Leitor.fromJson(jsonDecode(response.body));
  }

  Future putLeitor(int id, Leitor leitor) async {
    final Response response = await client.put(baseUrl + 'leitor?id=$id',
        body: jsonEncode(leitor.toJson()));
    return Leitor.fromJson(jsonDecode(response.body));
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
