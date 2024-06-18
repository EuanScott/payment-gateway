part of '../card_history.dart';

/// Builds a list of captured cards with a delete button for each card.
///
/// This function takes a `BuildContext`, a list of `MyCardDetails` objects representing the captured cards,
/// and a `deleteCard` function as parameters. It returns a `ListView.builder` widget that builds a list of cards.
/// Each card is represented by a `ListTile` widget with the card number as the title and additional card details
/// as the subtitle. The trailing widget of the `ListTile` is a delete button.
///
/// The `deleteCard` function is called when the delete button is pressed. It takes the index of the card and the
/// card number as parameters.
///
/// The list of cards is obtained from the `capturedCards` parameter.
///
/// This function is part of the 'card_history.dart' file.
Widget buildCardList(BuildContext context, List<MyCardDetails> capturedCards,
    Function deleteCard) {
  return ListView.builder(
    itemCount: capturedCards.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
        child: Card(
          child: ListTile(
            title: Text(capturedCards[index].number),
            subtitle: Text(
                'Type: ${capturedCards[index].type}\nCVV: ${capturedCards[index].cvv}\nCountry: ${capturedCards[index].country}'),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red[400]),
              onPressed: () => deleteCard(index, capturedCards[index].number),
            ),
          ),
        ),
      );
    },
  );
}
