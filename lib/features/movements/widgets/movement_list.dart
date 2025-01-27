import 'package:flutter/material.dart';
import '../movements_controller.dart';

class MovementList extends StatelessWidget {
  final MovementsController controller;

  const MovementList({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchMovements(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.movements.length,
          itemBuilder: (context, index) {
            final movement = controller.movements[index];
            return ListTile(
              title: Text(movement['description']),
              subtitle: Text(movement['date']),
              trailing: Text('${movement['amount']} €'),
              onLongPress: () => controller.deleteMovement(movement['id']),
            );
          },
        );
      },
    );
  }
}
