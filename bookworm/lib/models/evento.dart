import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Evento {
  final int idEvento;
  final String titulo;
  final String descricao;
  final String responsavel;
  final String email;

  Evento(
    this.idEvento,
    this.titulo,
    this.descricao,
    this.responsavel,
    this.email,
  );

  Evento.fromJson(Map<String, dynamic> json)
      : idEvento = json['IDEvento'],
        titulo = json['Titulo'],
        descricao = json['Descricao'],
        responsavel = json['Responsavel'],
        email = json['Email'];
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
        eventos =
            (json['eventos'] as List).map((e) => Evento.fromJson(e)).toList();
}

class EventoClienteWeb {
  Future<EventoWeb> getEventoWeb(int page) async {
    final Response response =
        await client.get(baseUrl + "eventos?page=$page&count=20");
    if (response.statusCode == 200) {
      return EventoWeb.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao buscar eventos!');
    }
  }
}
