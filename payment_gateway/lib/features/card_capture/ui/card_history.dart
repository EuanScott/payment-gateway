import 'package:flutter/material.dart';

import '../models/card_details.dart';

class CardHistoryPage extends StatefulWidget {
  const CardHistoryPage({super.key});

  @override
  _CardHistoryState createState() => _CardHistoryState();
}

class _CardHistoryState extends State<CardHistoryPage> {

  final List<CardDetails> capturedCards = [
    CardDetails('1234567890123456', 'Visa', '123', 'USA'),
    CardDetails('1234567890123456', 'Visa', '123', 'USA'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card History"),
      ),
      body: ListView.builder(
        itemCount: capturedCards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
            child: Card(
              child: ListTile(
                title: Text(capturedCards[index].number),
                subtitle: Text(
                    'Type: ${capturedCards[index]
                        .type}\nCVV: ${capturedCards[index]
                        .cvv}\nCountry: ${capturedCards[index].country}'),
                onTap: () {
                  print('Card ${capturedCards[index].number} tapped');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}