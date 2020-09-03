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
