import 'package:flutter/material.dart';

class CardHistoryPage extends StatelessWidget {
  const CardHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Cards History'),
      ),
      body: const Center(
        child: Text('List of Saved Cards Here'),
      ),
    );
  }
}
