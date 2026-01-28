import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

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
}
