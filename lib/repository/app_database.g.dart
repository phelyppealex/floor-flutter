// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProfessorDao? _professorDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Professor` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `nome` TEXT NOT NULL, `cpf` TEXT NOT NULL, `matricula` TEXT NOT NULL, `nascimento` TEXT NOT NULL, `idade` INTEGER NOT NULL, `sexo` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProfessorDao get professorDao {
    return _professorDaoInstance ??= _$ProfessorDao(database, changeListener);
  }
}

class _$ProfessorDao extends ProfessorDao {
  _$ProfessorDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _professorInsertionAdapter = InsertionAdapter(
            database,
            'Professor',
            (Professor item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cpf': item.cpf,
                  'matricula': item.matricula,
                  'nascimento': item.nascimento,
                  'idade': item.idade,
                  'sexo': item.sexo
                },
            changeListener),
        _professorDeletionAdapter = DeletionAdapter(
            database,
            'Professor',
            ['id'],
            (Professor item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'cpf': item.cpf,
                  'matricula': item.matricula,
                  'nascimento': item.nascimento,
                  'idade': item.idade,
                  'sexo': item.sexo
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Professor> _professorInsertionAdapter;

  final DeletionAdapter<Professor> _professorDeletionAdapter;

  @override
  Future<List<Professor>> listarProfessores() async {
    return _queryAdapter.queryList('SELECT * FROM Professor',
        mapper: (Map<String, Object?> row) => Professor(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            cpf: row['cpf'] as String,
            matricula: row['matricula'] as String,
            nascimento: row['nascimento'] as String,
            idade: row['idade'] as int,
            sexo: row['sexo'] as String));
  }

  @override
  Stream<List<Professor>> listarPorId(int id) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Professor WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Professor(
            id: row['id'] as int?,
            nome: row['nome'] as String,
            cpf: row['cpf'] as String,
            matricula: row['matricula'] as String,
            nascimento: row['nascimento'] as String,
            idade: row['idade'] as int,
            sexo: row['sexo'] as String),
        arguments: [id],
        queryableName: 'Professor',
        isView: false);
  }

  @override
  Future<void> inserirProfessor(Professor professor) async {
    await _professorInsertionAdapter.insert(
        professor, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletarProfessor(Professor professor) async {
    await _professorDeletionAdapter.delete(professor);
  }
}
