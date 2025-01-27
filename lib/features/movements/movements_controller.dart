import 'package:flutter/material.dart';
import '../../db/database_helper.dart';

class MovementsController extends ChangeNotifier {
  final List<Map<String, dynamic>> _movements = [];
  final dbHelper = DatabaseHelper();

  List<Map<String, dynamic>> get movements => _movements;

  Future<void> fetchMovements() async {
    final db = await dbHelper.database;
    final data = await db.query('movements', orderBy: 'date DESC');
    //print('Movimenti caricati: ${controller.movements}');
    _movements.clear();
    _movements.addAll(data);
    notifyListeners();
    print('Lista aggiornata');
  }

  Future<void> addMovement(String description, double amount, DateTime date) async {
    final db = await dbHelper.database;
    await db.insert('movements', {
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
      
    });
    print('Movimento aggiunto: $description, $amount, $date');
    fetchMovements();
  }

  Future<void> deleteMovement(int id) async {
    final db = await dbHelper.database;
    await db.delete('movements', where: 'id = ?', whereArgs: [id]);
    fetchMovements();
  }
}
