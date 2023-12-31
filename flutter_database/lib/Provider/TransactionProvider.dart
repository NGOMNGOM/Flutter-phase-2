// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import '../database/transaction_db.dart';
import '/models/Transaction.dart';

class TransactionProvider extends ChangeNotifier {
  // example data

  List<Transactions> transactions = [];

  void initData() async // สำหรับการดึงข้อมูลจาก db (ถ้ามี)
  {
    var db = TransactionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    // บันทึกข้อมูล
    await db.insertData(statement);

    // ดึงข้อมูลมาแสดงผล
    transactions.insert(0, statement);
    transactions = await db.loadAllData();
    notifyListeners();
  }
}
