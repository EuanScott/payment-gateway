library country_listing;

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../utils/country_util.dart';
import '../../utils/secure_storage.dart';
import '../common/snackbar.dart';

part 'widgets/_fab.dart';

part 'widgets/_list_item.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryListPage> {
  TextEditingController controller = TextEditingController();
  final storage = FlutterSecureStorageImpl(const FlutterSecureStorage());

  //region Helper Methods

  void _addCountry(String country) {
    setState(() {
      Countries.bannedCountries.add(country);
      Countries.bannedCountries.sort();
    });

    SnackBarHelper.showSnackBar(context, '$country is now a banned country.');
  }

  void _deleteCountry(int index, String countryName) {
    setState(() {
      Countries.bannedCountries.removeAt(index);
    });

    SnackBarHelper.showSnackBar(context, '$countryName is now an allowed.');
  }

  //endregion

  //region UI Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Banned Countries')),
      body: buildCountryList(_deleteCountry),
      floatingActionButton: FabButton(_addCountry, controller),
    );
  }

  //endregion
}
