import 'package:flutter/material.dart';

import 'ui/card_capture/card_capture.dart';
import 'ui/card_history/card_history.dart';
import 'ui/country_listing/country_listing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const CardCapturePage(),
    const CardHistoryPage(),
    CountryListPage(),
  ];

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.credit_card), label: 'Card Capture'),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Card History'),
    BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Banned Countries'),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTabTapped,
          currentIndex: _currentIndex,
          items: _items,
        ),
      ),
    );
  }
}
