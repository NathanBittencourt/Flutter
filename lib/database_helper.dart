// ignore_for_file: unused_import, depend_on_referenced_packages, file_names, unused_field, prefer_const_declarations

import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  //final uma vez atribuído, o valor não sofrerá alteração
  static final _databaseName = 'Contato.db';
  static final _databaseVersion = 1;

  static final table = 'contato';

  static final columnId = 'id';
  static final columnNome = 'nome';
  static final columnIdade = 'idade';
  static final columnProfissao = 'profissao';

  //singleton = classe tem apenas uma referência
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //tem uma somente uma referência do BD
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    //instancia o DB no primeiro acesso
    _database = await _initDatabase();
    return _database!;
  }

  //abrir o BD e criá-lo se não existir
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $table($columnId INTEGER PRIMARY KEY, "
        "$columnNome TEXT  NOT NULL, $columnIdade INTEGER NOT NULL, $columnProfissao TEXT NOT NULL)");
  }

  //Métodos helper

  //Inserir uma linha no BD
  //Cada Map é um valor da coluna
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return db.insert(table, row);
  }

  //Retorna uma lista de Maps
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return db.query(table);
  }

  //Retorna a contagem dass linhas
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  //Alterando um registro que já foi inserido
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  //Excluindo um registro que já foi inserido
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}