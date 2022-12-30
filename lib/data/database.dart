//packge do flutter para manupular local do nosso device.
import 'package:path/path.dart';
import 'package:primeiro_projeto_alura/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(
    await getDatabasesPath(),
    'task.db',
  );

  return openDatabase(
    path,
    onCreate: (db, version) => db.execute(TaskDao.tableSql),
    version: 1,
  );
}
