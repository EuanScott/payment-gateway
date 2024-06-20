part of '../card_capture.dart';

class CardCaptureForm extends StatefulWidget {
  final FieldController numberField;
  final FieldController cvvField;
  final FieldController addressField;
  final MyCardDetails myCardDetails;
  final GlobalKey<FormState> formKey;
  final Function updateCardDetails;
  final Function submitCardDetails;
  final Function scanCard;

  const CardCaptureForm(
      this.numberField,
      this.cvvField,
      this.addressField,
      this.myCardDetails,
      this.formKey,
      this.updateCardDetails,
      this.submitCardDetails,
      this.scanCard,
      {super.key});

  @override
  State<CardCaptureForm> createState() => _CardCaptureFormState();
}

class _CardCaptureFormState extends State<CardCaptureForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: widget.formKey,
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
                            controller: widget.numberField.controller,
                            decoration: InputDecoration(
                              labelText: 'Number',
                              border: const OutlineInputBorder(),
                              errorText: widget.numberField.error.isEmpty
                                  ? null
                                  : widget.cvvField.error,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            maxLength: 16,
                            onChanged: (value) =>
                                widget.updateCardDetails(value),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            widget.myCardDetails.type.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: widget.cvvField.controller,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: const OutlineInputBorder(),
                      errorText: widget.cvvField.error.isEmpty
                          ? null
                          : widget.cvvField.error,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    maxLength: 3,
                    onChanged: (value) {
                      setState(() {
                        widget.myCardDetails.cvv = value;
                        widget.cvvField.error = '';
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: widget.addressField.controller,
                    decoration: InputDecoration(
                      labelText: 'Country',
                      border: const OutlineInputBorder(),
                      errorText: widget.addressField.error.isEmpty
                          ? null
                          : widget.addressField.error,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]'))
                    ],
                    onChanged: (value) {
                      setState(() {
                        widget.myCardDetails.country = value;
                        widget.addressField.error = '';
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () => widget.scanCard(),
                            child: const Text('Scan'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            onPressed: () => widget.submitCardDetails(),
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
  }
}
