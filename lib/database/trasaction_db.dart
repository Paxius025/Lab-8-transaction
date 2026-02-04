import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../model/transaction.dart';

class TransactionDB {
  String dbName; // ชื่อฐานข้อมูล

  // ถ้า DB ยังไม่ถูกสร้าง => DB จะสร้างให้อัตโนมัติ
  // ถ้าเคยมี DB อยู่แล้ว => จะเปิด DB นั้นขึ้นมา
  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    // หา Directory ของแอป
    Directory appDirectory = await getApplicationDocumentsDirectory();
    // กำหนดตำแหน่งของฐานข้อมูล
    String dbLocation = join(appDirectory.path, dbName);
    // print(dbLocation);
    // สร้างฐานข้อมูล
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> insertData(Transactions statement) async {
    //ฐานข้อมูล => Store
    //transactions.db => expense
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");
    //json
    var keyID = await store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String(),
    });
    db.close();
    return keyID;
  }

  Future<List<Transactions>> loadAllData() async {
    var db = await openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(
      db,
      finder: Finder(sortOrders: [SortOrder(Field.key, false)]),
    );
    List<Transactions> transactions = [];
    for (var record in snapshot) {
      transactions.add(
        Transactions(
          title: record["title"] as String,
          amount: record["amount"] as double,
          date: DateTime.parse(record["date"] as String),
        ),
      );
    }
    db.close();
    return transactions;
  }
}
