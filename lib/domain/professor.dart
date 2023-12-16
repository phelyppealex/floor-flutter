import 'package:floor/floor.dart';

@entity
class Professor{
  @PrimaryKey(autoGenerate: true)
  int? id;
  String nome;
  String cpf;
  String matricula;
  String nascimento;
  int idade;
  String sexo;

  Professor({
    this.id,
    required this.nome,
    required this.cpf,
    required this.matricula,
    required this.nascimento,
    required this.idade,
    required this.sexo,
  });

  @override
  String toString(){
    return 'Professor{nome: $nome,cpf: $cpf,matricula: $matricula,nascimento: $nascimento,sexo: $sexo}';
  }
}