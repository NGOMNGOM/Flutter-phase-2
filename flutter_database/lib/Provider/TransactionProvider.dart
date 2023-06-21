import 'package:flutter/foundation.dart';
import '/models/Transaction.dart';

class TransactionProvider with ChangeNotifier {
  // example data
  List<Transaction> transactions = [
    Transaction("Book", 500, DateTime.now()),
    Transaction("Cloth", 600, DateTime.now()),
    Transaction("Pants", 400, DateTime.now())
  ];

  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaaction(Transaction statement) {
    transactions.add(statement);
  }
}
