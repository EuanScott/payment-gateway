part of '../country_listing.dart';

/// A floating action button that opens a dialog to add a new country.
///
/// This is a stateless widget that builds a floating action button. When the button is pressed,
/// it opens a dialog that allows the user to add a new country. The dialog contains a text field
/// for the user to enter the country name and two buttons: 'Cancel' and 'Add'.
///
/// The 'Cancel' button closes the dialog without making any changes. The 'Add' button calls the
/// `addCountry` function with the text entered by the user, clears the text field, and then closes
/// the dialog.
///
/// The `addCountry` function and the text field's controller are passed to this widget as parameters.
class FabButton extends StatelessWidget {
  final Function addCountry;
  final TextEditingController controller;

  const FabButton(this.addCountry, this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add Country'),
              content: TextField(
                controller: controller,
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    addCountry(controller.text);
                    controller.clear();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
