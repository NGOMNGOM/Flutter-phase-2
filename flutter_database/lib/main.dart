import 'package:flutter/material.dart';
import 'package:flutter_database/Provider/TransactionProvider.dart';
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
        home: Home(),
      ),
    );
  }
}
