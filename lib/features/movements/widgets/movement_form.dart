import 'package:flutter/material.dart';
import '../movements_controller.dart';

class MovementForm extends StatefulWidget {
  final MovementsController controller;

  const MovementForm({required this.controller, super.key});

  @override
  State<MovementForm> createState() => _MovementFormState();
}

class _MovementFormState extends State<MovementForm> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitForm() {
    final description = _descriptionController.text;
    final amount = double.tryParse(_amountController.text) ?? 0.0;

    if (description.isEmpty || amount <= 0) return;

    widget.controller.addMovement(description, amount, _selectedDate);
    _descriptionController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Descrizione'),
          ),
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(labelText: 'Importo'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Aggiungi Movimento'),
          ),
        ],
      ),
    );
  }
}
