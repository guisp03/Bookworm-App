import 'package:teste/http/connection.dart';
import 'dart:convert';
import 'package:http/http.dart';

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

  Future<TipoLeitor> getTipoLeitor() async{
    final Response response = await client.get(baseUrl);
    return TipoLeitor.fromJson(jsonDecode(response.body));
  }

  Future<TipoLeitor> putTipoLeitor(TipoLeitor tipoLeitor) async{
    final Response response = await client.put(baseUrl, body: tipoLeitor);
    return TipoLeitor.fromJson(jsonDecode(response.body));
  }

}
