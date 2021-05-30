import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db_models.dart';

class DB {
  final int version = 1;
  Database db;

  static final DB _dbHelper = DB._internal();

  DB._internal();

  factory DB() {
    return _dbHelper;
  }

  Future<void> openDb() async {
    if (db == null) {
      db = await openDatabase(join(await getDatabasesPath(), 'shopping.db'),
          onCreate: (database, version) {
        database.execute("""CREATE TABLE purchases
                (id INTEGER PRIMARY KEY,
                quantity INTEGER,
                type TEXT,
                comment TEXT)""");
      }, version: version);
    }
  }

  Future<int> updatePurchase(Purchase purchase) async {
    int id = await this.db.insert(
          'purchases',
          purchase.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
    print(purchase);
    return id;
  }

  Future<List<Purchase>> getPurchases() async {
    final List<Map<String, dynamic>> maps = await db.query('purchases');
    return List.generate(maps.length, (i) {
      return Purchase(
        id: maps[i]['id'],
        type: maps[i]['type'],
        quantity: maps[i]['quantity'],
        comment: maps[i]['comment'],
      );
    });
  }

  Future<int> deleteList(Purchase purchase) async {
    int result =
        await db.delete("items", where: "idList = ?", whereArgs: [purchase.id]);
    return result;
  }
}
