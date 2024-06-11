import 'package:flutter/material.dart';
import './features/card_capture/card_capture.dart';
import './features/card_history/card_history.dart';
import './features/country_listing/country_listing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Card App',
      initialRoute: '/',
      routes: {
        '/': (context) => const CardCapturePage(),
        '/history': (context) => const CardHistoryPage(),
        '/update': (context) => const CountryListingPage(),
      },
    );
  }
}
