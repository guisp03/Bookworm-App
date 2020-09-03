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
}
