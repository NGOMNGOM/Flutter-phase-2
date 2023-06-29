// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import '/models/Transaction.dart';

class TransactionProvider extends ChangeNotifier {
  // example data
  List<Transaction> transactions = [
    Transaction(title: "Book", amount: 500, date: DateTime.now()),
    Transaction(title: "Cloth", amount: 600, date: DateTime.now()),
    Transaction(title: "Pants", amount: 400, date: DateTime.now())
  ];

  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaaction(Transaction statement) {
    transactions.add(statement);
    notifyListeners();
  }
}
