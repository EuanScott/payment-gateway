import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:payment_gateway/shared/redux.dart';

import '../models/card_details.dart';
import '../utils/card_util.dart';

class CardCapturePage extends StatelessWidget {
  const CardCapturePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card'),
      ),
      body: CardDetailsForm(),
    );
  }
}

class CardDetailsForm extends StatefulWidget {
  CardDetailsForm({Key? key});

  @override
  State<CardDetailsForm> createState() => _CardDetailsFormState();
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  CardDetails cardDetails = CardDetails('', '', '', '');

  String _getCardTypeFrmNumber(String cardNumber) {
    String input = CardUtils.getCleanedNumber(cardNumber);
    String cardType = CardUtils.getCardTypeFrmNumber(input);
    return cardType;
  }

  void _scanCard() {
    print("Scanning Card");
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Function(CardDetails)>(
      converter: (store) {
        return (cardDetails) => store.dispatch(AddCardAction(cardDetails));
      },
      builder: (context, callback) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: const EdgeInsets.only(right: 8.0),
                              // Add margin here
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Number',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    cardDetails.type =
                                        _getCardTypeFrmNumber(value);
                                    cardDetails.number = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your card number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                cardDetails.type.toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'CVV',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            cardDetails.cvv = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your card cvv';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Country',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            cardDetails.country = value;
                          });
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Za-z]')),
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your country of issue';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _scanCard();
                                },
                                child: const Text('Scan'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // TODO: Check that the card is not on the blocked list of countries
                                    callback(cardDetails);
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
