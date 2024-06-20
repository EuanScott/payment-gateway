library card_capture;

import 'dart:convert';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:payment_gateway/utils/country_util.dart';

import '../../models/card_details.dart';
import '../../models/field_controller.dart';
import '../../utils/card_util.dart';
import '../../utils/secure_storage.dart';
import '../common/snackbar.dart';

part 'widgets/_card_capture_form.dart';

class CardCapturePage extends StatefulWidget {
  const CardCapturePage({super.key});

  @override
  _CardCapturePageState createState() => _CardCapturePageState();
}

class _CardCapturePageState extends State<CardCapturePage> {
  //region Properties

  final _formKey = GlobalKey<FormState>();
  MyCardDetails myCardDetails = MyCardDetails('', '', '', '');
  final storage = FlutterSecureStorageImpl(const FlutterSecureStorage());

  final FieldController _numberField = FieldController();
  final FieldController _cvvField = FieldController();
  final FieldController _addressField = FieldController();

  //endregion

  //region Helper Methods

  Future<void> _scanCard() async {
    CardDetails? cardDetails = await CardScanner.scanCard();
    if (!mounted || cardDetails == null) return;
    _numberField.controller.text = cardDetails.cardNumber;
    _updateCardDetails(cardDetails.cardNumber);
  }

  Future<void> _submitCardDetails() async {
    if (_formKey.currentState!.validate()) {
      if (_numberField.controller.text.isEmpty) {
        setState(() => _numberField.error = 'Please enter your card number');
        return;
      }

      if (_cvvField.controller.text.isEmpty) {
        setState(() => _cvvField.error = 'Please enter your card cvv');
        return;
      }

      if (_isCountryBanned(myCardDetails.country) ||
          _addressField.controller.text.isEmpty) {
        setState(() => _addressField.error = 'Please enter a valid country.');
        return;
      }
    }

    if (await _checkIfCardExits(myCardDetails)) {
      SnackBarHelper.showSnackBar(context, 'Card details already exist');
    }

    storage
        .write(myCardDetails.number, jsonEncode(myCardDetails.toJson()))
        .then((value) => SnackBarHelper.showSnackBar(
            context, 'Card details saved successfully.'))
        .catchError((error) => SnackBarHelper.showSnackBar(
            context, 'Error occurred while saving card details.'));
  }

  String _getCardTypeFrmNumber(String cardNumber) =>
      CardUtils.getCardTypeFrmNumber(CardUtils.getCleanedNumber(cardNumber));

  static bool _isCountryBanned(String country) => Countries.bannedCountries
      .map((bannedCountry) => bannedCountry.toLowerCase())
      .contains(country.toLowerCase());

  Future<bool> _checkIfCardExits(MyCardDetails cardDetails) async {
    String? value = await storage.read(cardDetails.number);
    return value != null;
  }

  void _updateCardDetails(String value) {
    setState(() {
      myCardDetails.type = _getCardTypeFrmNumber(value);
      myCardDetails.number = value;
      _numberField.error = '';
    });
  }

  //endregion

  //region UI Build

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Card')),
      body: CardCaptureForm(
        _numberField,
        _cvvField,
        _addressField,
        myCardDetails,
        _formKey,
        _updateCardDetails,
        _submitCardDetails,
        _scanCard,
      ),
    );
  }

//endregion
}
