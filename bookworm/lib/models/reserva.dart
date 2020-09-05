import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class Reserva {
  final int idProduto;
  final int idLeitor;
  final String dataReserva;

  Reserva(this.idProduto, this.idLeitor, this.dataReserva);

  Reserva.fromJson(Map<String, dynamic> json)
      : idProduto = json['idProduto'],
        idLeitor = json['idLeitor'],
        dataReserva = json['dataReserva'];

  Map<String, dynamic> toJson() =>
      {
        'idProduto' : idProduto,
        'idLeitor' : idLeitor,
        'dataReserva' : dataReserva
      };

  Future<Reserva> getReserva() async{
    final Response response = await client.get(baseUrl);
    return Reserva.fromJson(jsonDecode(response.body));
  }

  Future<Reserva> putReserva(Reserva reserva) async{
    final Response response = await client.put(baseUrl, body: reserva);
    return Reserva.fromJson(jsonDecode(response.body));
  }
}
