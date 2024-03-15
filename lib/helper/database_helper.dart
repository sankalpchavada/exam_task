import 'package:firebase_connect/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  DatabaseHelper._();

 static final DatabaseHelper databaseHelper = DatabaseHelper._();
  static Database? _database;
  static final _tableName = 'products';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'products.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE $_tableName(
          id INTEGER PRIMARY KEY,
          productCategory TEXT,
          name TEXT,
          brand TEXT,
          description TEXT,
          basePrice REAL,
          inStock INTEGER,
          stock INTEGER,
          featuredImage TEXT,
          thumbnailImage TEXT,
          storageOptions TEXT,
          colorOptions TEXT,
          display TEXT,
          CPU TEXT,
          GPU TEXT,
          rearCamera TEXT,
          frontCamera TEXT
        )
      ''');
    }, version: 1);
  }

  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(_tableName, product as Map<String, Object?>);
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        productCategory: maps[i]['productCategory'],
        name: maps[i]['name'],
        brand: maps[i]['brand'],
        description: maps[i]['description'],
        basePrice: maps[i]['basePrice'],
        inStock: maps[i]['inStock'] == 1,
        stock: maps[i]['stock'],
        featuredImage: maps[i]['featuredImage'],
        thumbnailImage: maps[i]['thumbnailImage'],
        storageOptions: maps[i]['storageOptions'].split(', '),
        colorOptions: maps[i]['colorOptions'].split(', '),
        display: maps[i]['display'],
        CPU: maps[i]['CPU'],
        GPU: maps[i]['GPU'],
        camera: maps[i]['camera']
      );
    });
  }


}
