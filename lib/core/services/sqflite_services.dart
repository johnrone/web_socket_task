import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteService {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDatabase();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'task.db');
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      // onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  // _onUpgrade(Database db, int oldVersion, int newVersion) {
  //   print('onupgradeeeeeeeeeeeeeeeee===========================');
  // }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE users(
id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
userName TEXT,
email TEXT,
password TEXT,
commercialName TEXT,
commercialAccount TEXT,
storeLicense TEXT
)
''');
    print('oncreate===========================');
  }

  Future<List<Map<dynamic, dynamic>>> readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
