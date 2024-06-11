import 'package:flutter/material.dart';

class CardCapturePage extends StatelessWidget {
  const CardCapturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Card Details'),
      ),
      body: const Center(
        child: Text('Add Card Form Here'),
      ),
    );
  }
}
