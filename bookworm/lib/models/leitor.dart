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

  Map<String, dynamic> toJson() => {
        'email': email,
        'senha': senha,
      };

  Future<Leitor> getLeitor() async{
    final Response response = await client.get(baseUrl);
    return Leitor.fromJson(jsonDecode(response.body));
  }

  Future<Leitor> putLeitor(Leitor leitor) async{
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

