import 'package:flutter/material.dart';
import 'package:flutter_database/Provider/TransactionProvider.dart';
import 'package:flutter_database/Screen/form_screen.dart';
import 'package:flutter_database/Screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider())
      ],
      child: MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.indigo,
              body: TabBarView(
                children: [Home(), FormScreen()],
              ),
              bottomNavigationBar: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.list),
                    text: "Screen1",
                  ),
                  Tab(
                    icon: Icon(Icons.add),
                    text: "Screen2",
                  )
                ],
              ),
            )),
        theme: ThemeData(primarySwatch: Colors.indigo),
      ),
    );
  }
}
