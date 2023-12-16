import 'package:floor/floor.dart';
import 'package:segunda_prova/domain/professor.dart';

@dao
abstract class ProfessorDao {
  @Query('SELECT * FROM Professor')
  Future<List<Professor>> listarProfessores();

  @Query('SELECT * FROM Professor WHERE id = :id')
  Stream<List<Professor>> listarPorId(int id);

  @delete
  Future<void> deletarProfessor(Professor professor);

  @insert
  Future<void> inserirProfessor(Professor professor);
}