import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_database/Provider/TransactionProvider.dart';
import 'package:flutter_database/Screen/form_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                icon: const Icon(Icons.exit_to_app))
          ],
        ),
        body: Consumer(
            builder: (context, TransactionProvider provider, Widget? child) {
          if (provider.transactions.isEmpty) {
            return Center(
              child: Text("No information", style: TextStyle(fontSize: 20)),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, int index) {
                  var statement = provider.transactions[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: FittedBox(
                          child: Text(statement.amount.toString()),
                        ),
                      ),
                      title: Text(statement.title),
                      subtitle:
                          Text(DateFormat("dd/MM/yyyy").format(statement.date)),
                    ),
                  );
                }),
          );
        }));
    ;
  }
}
