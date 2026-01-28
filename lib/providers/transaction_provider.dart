import 'package:flutter/foundation.dart';
import '../model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    Transactions(title: "กระเป๋า", amount: 100, date: DateTime.now()),
    Transactions(title: "เสื้อ", amount: 200, date: DateTime.now()),
    Transactions(title: "กางเกง", amount: 300, date: DateTime.now()),
  ];
  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) {
    transactions.add(statement);
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
