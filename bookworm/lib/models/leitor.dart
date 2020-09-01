class Leitor{
  //final int idLeitor;
  //final int idTipoLeitor;
  //final String nome;
  //final String cpf;
  //final String rg;
  //final String dataNasc;
  //final String endereco;
  //final String telefone;
  final String email;
  final String senha;
  //final Image imagemLeitor;

  Leitor(
    //  this.idLeitor,
      //this.idTipoLeitor,
      //this.nome,
      //this.cpf,
      //this.rg,
      //this.dataNasc,
      //this.endereco,
      //this.telefone,
      this.email,
      this.senha,
      //this.imagemLeitor,
      );

      Map<String, dynamic> toJson() =>
      {
        'email': email,
        'senha': senha,
      };
}
