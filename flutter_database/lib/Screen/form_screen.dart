import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Second Page"),
        ),
        body: Form(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "First Input"),
                autofocus: true,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Second Input")),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      elevation: 5,
                      backgroundColor: Colors.amber),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Submit"))
            ],
          ),
        )));
  }
}
