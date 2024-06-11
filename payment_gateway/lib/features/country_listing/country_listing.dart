import 'package:flutter/material.dart';

class CountryListingPage extends StatelessWidget {
  const CountryListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Card List'),
      ),
      body: const Center(
        child: Text('List of Cards to Update Here'),
      ),
    );
  }
}
