import 'package:flutter/material.dart';
import 'package:flutter_database/Provider/TransactionProvider.dart';
import 'package:flutter_database/Screen/form_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<TransactionProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormScreen()));
                },
                icon: const Icon(Icons.ac_unit))
          ],
        ),
        body: Consumer(
            builder: (context, TransactionProvider provider, Widget? child) {
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
                      subtitle: Text(statement.date.toString()),
                    ),
                  );
                }),
          );
        }));
  }
}
