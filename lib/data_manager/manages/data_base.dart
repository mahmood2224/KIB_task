// import 'package:kib_task/data/models/item_model.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class SqlDataBase {
//   static const String DB_NAME = "demo.db";
//   static const String DB_TABLE_NAME = "items";
//   static const String DB_COLUMN_ID = "id";
//   static const String DB_COLUMN_NAME = "name";
//   static const String DB_COLUMN_DESC = "desc";
//
//   static Future<String> getPath() async {
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, SqlDataBase.DB_NAME);
//     return path;
//   }
//
//   static delete() async {
//       await deleteDatabase(await getPath());
//
//   }
//
//   static Future<Database> getDatabase() async {
//     Database database = await openDatabase(await getPath(), version: 1,
//         onCreate: (Database db, int version) async {
//           await db.execute(
//               'CREATE TABLE $DB_TABLE_NAME ($DB_COLUMN_ID INTEGER PRIMARY KEY, $DB_COLUMN_NAME TEXT, $DB_COLUMN_DESC TEXT)');
//         });
//     return database ;
//   }
//
//   static Future<ItemModel> insert(ItemModel item) async {
//     Database db = await getDatabase();
//     int id = await db.rawInsert("INSERT INTO $DB_TABLE_NAME($DB_COLUMN_NAME , $DB_COLUMN_DESC VALUES (${item.name} , ${item.desc})" );
//      item.id = id ;
//      return item ;
//   }
//
//   static Future<ItemModel> update(ItemModel item) async{
//     Database db = await getDatabase();
//     int count = await db.rawUpdate(
//         'UPDATE $DB_TABLE_NAME} SET $DB_COLUMN_NAME = ?, $DB_COLUMN_DESC = ? WHERE $DB_COLUMN_ID = ?',
//         [item.name, item.desc, item.id]);
//
//     return item ;
//   }
//
//   static Future<bool> deleteItem(int id) async {
//     Database db = await getDatabase();
//     int count = await db
//         .rawDelete('DELETE FROM $DB_TABLE_NAME WHERE $DB_COLUMN_ID = $id');
//     return count == 1  ;
//   }
//
//   static Future<List<ItemModel>> getData() async {
//     Database db = await getDatabase();
//     List<Map> list = await db.rawQuery('SELECT * FROM $DB_TABLE_NAME ORDER BY DESC');
//
//     List<ItemModel> result = list.map((e) => ItemModel.fromDB(e)).toList() ;
//
//     return result ;
//   }
// }
