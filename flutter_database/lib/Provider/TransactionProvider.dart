// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import '/models/Transaction.dart';

class TransactionProvider extends ChangeNotifier {
  // example data
  List<Transaction> transactions = [];

  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaaction(Transaction statement) {
    transactions.insert(0, statement);
    notifyListeners();
  }
}
