import 'package:flutter/material.dart';
import 'package:flutter_database/Provider/TransactionProvider.dart';
import 'package:flutter_database/main.dart';
import 'package:flutter_database/models/Transaction.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var title = Te

    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "TITLE"),
                  controller: titleController,
                  autofocus: false,
                  validator: (String? input) {
                    if (input!.isEmpty) {
                      return "Please Input";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "AMOUNT"),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  validator: (String? input) {
                    if (input!.isEmpty) {
                      return "Please input";
                    } else if (double.parse(input) <= 0) {
                      return "Please input more than 0";
                    }
                    return null;
                  },
                ),
                TextButton(
                  onPressed: () {
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);

                    if (formKey.currentState!.validate()) {
                      var title = titleController.text;
                      var amount = amountController.text;

                      var statement = Transactions(
                          title: title,
                          amount: double.parse(amount),
                          date: DateTime.now());

                      provider.addTransaction(statement);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => MyApp()));
                    }
                  },
                  style: TextButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.indigo,
                  ),
                  child: const Text(
                    "submit",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
