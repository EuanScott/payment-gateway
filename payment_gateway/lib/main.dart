import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './features/card_capture/card_capture.dart';
import './features/card_history/card_history.dart';
import './features/country_listing/country_listing.dart';
import 'shared/redux.dart';

void main() {
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Flutter Card App',
          initialRoute: '/',
          routes: {
            '/': (context) => const CardCapturePage(),
            '/history': (context) => const CardHistoryPage(),
            '/update': (context) => const CountryListingPage(),
          },
        ));
  }
}
