import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:payment_gateway/shared/redux.dart';

import 'models/card_details.dart';

class CardCapturePage extends StatelessWidget {
  const CardCapturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Card Details'),
      ),
      body: CardDetailsForm(),
    );
  }
}

class CardDetailsForm extends StatefulWidget {
  CardDetailsForm({super.key});

  @override
  State<CardDetailsForm> createState() => _CardDetailsFormState();
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  CardType cardType = CardType.CREDIT;
  CardDetails cardDetails = CardDetails('', '', '', '');

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Function(CardDetails)>(
      converter: (store) {
        return (cardDetails) => store.dispatch(AddCardAction(cardDetails));
      },
      builder: (context, callback) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Number'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  onChanged: (value) {
                    setState(() {
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
                // TODO: Style this nicely :P
                DropdownButton<CardType>(
                  value: cardType,
                  items: CardType.values.map((CardType cardType) {
                    return DropdownMenuItem<CardType>(
                      value: cardType,
                      child: Text(cardType.toString().split('.').last),
                    );
                  }).toList(),
                  onChanged: (CardType? selectedCardType) {
                    setState(() {
                      cardType = selectedCardType!;
                    });
                    cardDetails.type = selectedCardType.toString();
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'CVV'),
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
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Country'),
                  onChanged: (value) {
                    setState(() {
                      cardDetails.country = value;
                    });
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your country of issue';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      callback(cardDetails);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
