import 'package:flutter/material.dart';
import 'movements_controller.dart';
import 'widgets/movement_form.dart';
import 'widgets/movement_list.dart';

class MovementsView extends StatelessWidget {
  const MovementsView({super.key});

  @override
  Widget build(BuildContext context) {
    final MovementsController controller = MovementsController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestione Movimenti'),
      ),
      body: Column(
        children: [
          MovementForm(controller: controller),
          Expanded(
            child: MovementList(controller: controller),
          ),
          
        ],
      ),
    );
  }
}
