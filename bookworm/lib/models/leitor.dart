import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Leitor {
  final int idLeitor;
  final int idTipoLeitor;
  final String nome;
  final String dataNasc;
  final String endereco;
  final String telefone;
  final String email;
  final String senha;
  final ImageProvider imagemLeitor;

  Leitor(this.idLeitor, this.idTipoLeitor, this.nome, this.dataNasc,
      this.endereco, this.telefone, this.email, this.senha, this.imagemLeitor);

  Leitor.fromJson(Map<String, dynamic> json)
      : idLeitor = json['idLeitor'],
        idTipoLeitor = json['idTipoLeitor'],
        nome = json['nome'],
        dataNasc = json['dataNasc'],
        endereco = json['endereco'],
        telefone = json['telefone'],
        email = json['email'],
        senha = json['senha'],
        imagemLeitor = json['imagemLeitor'];

  Map<String, dynamic> toJson() => {
        'idLeitor': idLeitor,
        'idTipoLeitor': idTipoLeitor,
        'nome': nome,
        'dataNasc': dataNasc,
        'endereco': endereco,
        'telefone': telefone,
        'email': email,
        'senha': senha,
        'imagemLeitor': imagemLeitor,
      };

  Future<Leitor> getLeitor() async {
    final Response response = await client.get(baseUrl);
    return Leitor.fromJson(jsonDecode(response.body));
  }

  Future<Leitor> putLeitor(Leitor leitor) async {
    final Response response = await client.put(baseUrl, body: leitor);
    return Leitor.fromJson(jsonDecode(response.body));
  }
}

class TipoLeitor {
  final int idTipoLeitor;
  final String tipo;

  TipoLeitor(this.idTipoLeitor, this.tipo);

  TipoLeitor.fromJson(Map<String, dynamic> json)
      : idTipoLeitor = json['idTipoLeitor'],
        tipo = json['tipo'];

  Map<String, dynamic> toJson() => {
        'idTipoLeitor': idTipoLeitor,
        'tipo': tipo,
      };
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
