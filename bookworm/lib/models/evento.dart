import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Evento {
  final int idEvento;
  final String titulo;
  final String descricao;
  final String responsavel;
  //final String email;

  Evento(this.idEvento, this.titulo, this.descricao, this.responsavel
      //this.email,
      );

  Evento.fromJson(Map<String, dynamic> json)
      : idEvento = json['idEvento'],
        titulo = json['titulo'],
        descricao = json['descricao'],
        responsavel = json['responsavel'];

  Map<String, dynamic> toJson() =>
      {
        'idEvento' : idEvento,
        'titulo' : titulo,
        'descricao' : descricao,
        'responsavel' : responsavel,
      };

  Future<Evento> getEvento() async{
    final Response response = await client.get(baseUrl);
    return Evento.fromJson(jsonDecode(response.body));
  }

  Future<Evento> putEvento(Evento evento) async{
    final Response response = await client.put(baseUrl, body: evento);
    return Evento.fromJson(jsonDecode(response.body));
  }

  Future<List<Evento>> getEventos() async{
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Evento.fromJson(json))
        .toList();
  }
}
