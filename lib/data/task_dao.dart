import 'package:primeiro_projeto_alura/components/task.dart';
import 'package:primeiro_projeto_alura/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {
    print('Iniciando o save da tarefa: $tarefa');
    final Database db = await getDatabase();
    var itemExists = await find(tarefa.name);
    Map<String, dynamic> taskMap = toMap(tarefa);

    if (itemExists.isEmpty) {
      print('tarefa não existia');
      return await db.insert(_tableName, taskMap);
    } else {
      print('Tarefa já existe!');
      return await db.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.name],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em MAP');
    final Map<String, dynamic> mapaDeTarefas =
        {}; //vazio iniciar -> Map() ou {}
    mapaDeTarefas[_name] = tarefa.name;
    mapaDeTarefas[_difficulty] = tarefa.difficulty;
    mapaDeTarefas[_image] = tarefa.photo;
    print('Conversão realizada: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Acessando o findAll: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to list:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        name: linha[_name],
        difficulty: linha[_difficulty],
        photo: linha[_image],
      );
      tarefas.add(tarefa);
    }
    print('Lista de tarefas: $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando o find: ');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando a tarefa: $nomeDaTarefa');
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
