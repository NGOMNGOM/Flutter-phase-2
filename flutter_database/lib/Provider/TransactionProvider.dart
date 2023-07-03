// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import '../database/transaction_db.dart';
import '/models/Transaction.dart';

class TransactionProvider extends ChangeNotifier {
  // example data
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.insertData(statement);
    transactions.insert(0, statement);
    notifyListeners();
  }
}
