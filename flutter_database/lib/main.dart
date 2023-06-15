import 'package:flutter/material.dart';
import 'Screen/form_screen.dart';

void main() {
  var app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter with Database",
      home: const MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.brown),
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
        body: Container(child: Text("test")));
  }
}
