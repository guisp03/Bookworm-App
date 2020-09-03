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
}
