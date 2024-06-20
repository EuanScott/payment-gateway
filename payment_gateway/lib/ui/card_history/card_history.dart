import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/card_details.dart';
import '../../utils/secure_storage.dart';
import '../common/snackbar.dart';

part 'widgets/_card_list.dart';

class CardHistoryPage extends StatefulWidget {
  const CardHistoryPage({super.key});

  @override
  _CardHistoryState createState() => _CardHistoryState();
}

class _CardHistoryState extends State<CardHistoryPage> {
  final List<MyCardDetails> capturedCards = [];
  final storage = FlutterSecureStorageImpl(const FlutterSecureStorage());

  //region Helper Methods

  Future<List<MyCardDetails>> _loadCardData() async {
    List<String> keys = await storage.readAllKeys();

    for (String key in keys) {
      String? jsonData = await storage.read(key);
      if (jsonData != null) {
        MyCardDetails cardDetails = MyCardDetails.fromJson(jsonDecode(jsonData));
        capturedCards.add(cardDetails);
      }
    }

    return capturedCards;
  }

  Future<void> _deleteCard(int index, String cardNumber) async {
    MyCardDetails card = capturedCards.removeAt(index);

    await storage.delete(card.number);

    SnackBarHelper.showSnackBar(context, '$cardNumber has been deleted.');

    setState(() {});
  }

  //endregion

  //region UI Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Card History")),
      body: FutureBuilder<List<MyCardDetails>>(
        future: _loadCardData(),
        builder: (BuildContext context, AsyncSnapshot<List<MyCardDetails>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const Center(child: Text('No card history found.'));
          } else {
            return buildCardList(context, capturedCards, _deleteCard);
          }
        },
      ),
    );
  }
//endregion
}
