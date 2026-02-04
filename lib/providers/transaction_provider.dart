import 'package:flutter/foundation.dart';
import '../model/transaction.dart';
import '../database/trasaction_db.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    // Transactions(title: "กระเป๋า", amount: 100, date: DateTime.now()),
    // Transactions(title: "เสื้อ", amount: 200, date: DateTime.now()),
    // Transactions(title: "กางเกง", amount: 300, date: DateTime.now()),
  ];
  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    //บันทึกข้อมูล (Insert)
    await db.insertData(statement);
    //ดึงข้อมูลมาแสดงผล (Select)
    transactions = await db.loadAllData();
    //แจ้งเตือน Consumer
    notifyListeners();
  }

  void deleteTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.deleteData(statement);
    transactions = await db.loadAllData();
    notifyListeners();
  }

  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");
    //ดึงข้อมูลมาแสดงผล (Select)
    transactions = await db.loadAllData();
    notifyListeners();
  }
}
