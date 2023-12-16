import 'dart:async';
import 'package:floor/floor.dart';
import 'package:segunda_prova/domain/professor.dart';
import 'package:segunda_prova/repository/professor_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Professor])
abstract class AppDatabase extends FloorDatabase {
  ProfessorDao get professorDao;
}