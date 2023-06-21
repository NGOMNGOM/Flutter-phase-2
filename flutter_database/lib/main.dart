import 'package:flutter/material.dart';
import 'package:flutter_database/Provider/transactionProvider.dart';
import 'Screen/form_screen.dart';
import 'package:provider/provider.dart';

import 'models/Transaction.dart';

void main() {
  var app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return TransactionProvider();
          },
        )
      ],
      child: MaterialApp(
        title: "Flutter with Database",
        home: const MyHomePage(),
        theme: ThemeData(primarySwatch: Colors.brown),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Flutter with database"), actions: [
          IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return FormScreen();
                }));
              })
        ]),
        body: Consumer(
            builder: (context, TransactionProvider provider, Widget? child) {
          return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (BuildContext context, int index) {
                Transaction data = provider.transactions[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  elevation: 10,
                  child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child:
                              FittedBox(child: Text(data.amount.toString()))),
                      title: Text(data.title),
                      subtitle: Text(data.date.toString())),
                );
              });
        }));
  }
}
