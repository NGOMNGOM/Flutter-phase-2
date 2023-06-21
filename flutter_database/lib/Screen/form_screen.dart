import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  FormScreen({super.key});
  final formKey = GlobalKey<FormState>();

  // controller
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: "First Input"),
                    autofocus: true,
                    validator: (String? input) {
                      if (input!.isEmpty) {
                        return "Please input";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: "Second Input"),
                      validator: (String? input) {
                        if (input!.isEmpty) {
                          return "Please input";
                        } else if (double.parse(input) <= 0) {
                          return "Please input positive value";
                        }
                        return null;
                      }),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          elevation: 5,
                          backgroundColor: Colors.amber),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var title = titleController.text;
                          var amount = amountController.text;
                          print(title + amount);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Submit"))
                ],
              ),
            )));
  }
}
