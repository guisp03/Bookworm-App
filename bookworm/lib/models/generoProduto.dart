import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

class GeneroProduto {
  final int idGenero;
  final int idProduto;

  GeneroProduto(this.idGenero, this.idProduto);

  GeneroProduto.fromJson(Map<String, dynamic> json)
      : idGenero = json['idGenero'],
        idProduto = json['idProduto'];

  Map<String, dynamic> toJson() => {
    'idGenero': idGenero,
    'idProduto': idProduto,
  };

  Future<GeneroProduto> getGeneroProduto() async{
    final Response response = await client.get(baseUrl);
    return GeneroProduto.fromJson(jsonDecode(response.body));
  }

  Future<GeneroProduto> putGeneroProduto(GeneroProduto generoProduto) async{
    final Response response = await client.put(baseUrl, body: generoProduto);
    return GeneroProduto.fromJson(jsonDecode(response.body));
  }
}
