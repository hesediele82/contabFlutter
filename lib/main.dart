import 'package:flutter/material.dart';
import 'features/movements/movements_view.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestione Movimenti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovementsView(),
    );
  }
}
