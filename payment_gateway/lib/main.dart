import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'features/card_capture/ui/card_capture.dart';
import 'features/card_capture/ui/card_history.dart';
import 'features/card_capture/ui/country_listing.dart';
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
          // TODO: See about adding a more detailed theming here
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ),
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
