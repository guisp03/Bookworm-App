import 'dart:ui';

class Leitor{
  final int IDLeitor;
  final int IDTipoLeitor;
  final String Nome;
  final String CPF;
  final String RG;
  final String DataNasc;
  final String Endereco;
  final String Telefone;
  final String Email;
  final String Senha;
  final Image ImagemLeitor;

  Leitor(
      this.IDLeitor,
      this.IDTipoLeitor,
      this.Nome,
      this.CPF,
      this.RG,
      this.DataNasc,
      this.Endereco,
      this.Telefone,
      this.Email,
      this.Senha,
      this.ImagemLeitor,
      );
}