import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Evento {
  final int idEvento;
  final String titulo;
  final String descricao;
  final String responsavel;
  final String email;

  Evento(this.idEvento, this.titulo, this.descricao, this.responsavel,
      this.email,);

  Evento.fromJson(Map<String, dynamic> json)
      : idEvento = json['idEvento'],
        titulo = json['titulo'],
        descricao = json['descricao'],
        responsavel = json['responsavel'],
        email = json['email'];

/* Map<String, dynamic> toJson() =>
      {
        'idEvento' : idEvento,
        'titulo' : titulo,
        'descricao' : descricao,
        'responsavel' : responsavel,
        'email' : email,
      };

  Future<Evento> getEvento() async{
    final Response response = await client.get(baseUrl);
    return Evento.fromJson(jsonDecode(response.body));
  }

  Future<Evento> putEvento(Evento evento) async{
    final Response response = await client.put(baseUrl, body: evento);
    return Evento.fromJson(jsonDecode(response.body));
  }


}

class EventoWeb {
  Future<List<Evento>> getEventos() async{
    final Response response = await client.get("http://192.168.0.6:45457/eventos");
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Evento.fromJson(json))
        .toList();
  }*/
}


class EventoWeb {
  final int totalCount;
  final int count;
  final List<Evento> eventos;

  EventoWeb(
      this.totalCount,
      this.count,
      this.eventos,
      );

  EventoWeb.fromJson(Map<String, dynamic> json)
  : totalCount = json['total_count'],
    count = json['count'],
    eventos = (json['eventos'] as List).map((e) => Evento.fromJson(e)).toList();
}

class EventoClienteWeb {
  Future<EventoWeb> getEventoWeb(int page) async {
    final Response response = await client.get("http://192.168.0.6:45455/eventos");
    if (response.statusCode == 200) {
      return EventoWeb.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao buscar eventos!');
    }
  }
}
