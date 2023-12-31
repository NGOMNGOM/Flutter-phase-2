import 'package:flutter_database/models/Transaction.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  // class for DB management
  String dbName;

  // ถ้ายังไม่ถูกสร้าง => สร้าง
  // ถ้าสร้างแล้ว => เปิด

  TransactionDB({required this.dbName});

  // หาตำแหน่งที่เก็บข้อมูล
  // A B C
  // user/a
  // user/b
  Future<Database> openDB() async // ใช้ async เพราะเราต้องรอให้เปิด DB
  {
    var appDirectory = await getApplicationDocumentsDirectory();

    var dbLocation = join(appDirectory.path, dbName);

    // print(dbLocation);
    // สร้าง database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  // บันทึกข้อมูลลง DB => Store
  // transaction.db [Database] => expense [Table]
  Future<int> insertData(Transactions statement) async {
    var db = await openDB();
    var store = intMapStoreFactory.store("expense");

    // json
    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String(),
    });
    db.close();
    return keyID;
  }

  Future<List<Transactions>> loadAllData() async {
    var db = await openDB();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));

    // ดึงจาก snapshot มาใส่ใน list
    List<Transactions> transactionList = [];
    for (var record in snapshot) {
      transactionList.add(Transactions(
          title: (record["title"]).toString(),
          amount: double.parse((record["amount"]).toString()),
          date: DateTime.parse(record["date"].toString())));
    }

    // print(snapshot);
    return transactionList;
  }
}
