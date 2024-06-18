part of '../country_listing.dart';

/// Builds a list of countries with a delete button for each country.
///
/// This function takes a `deleteCountry` function as a parameter and returns a `ListView.builder`
/// widget that builds a list of countries. Each country is represented by a `ListTile` widget
/// with the country name as the title and a delete button as the trailing widget.
///
/// The `deleteCountry` function is called when the delete button is pressed. It takes the index
/// of the country and the country name as parameters.
///
/// The list of countries is obtained from the `Countries.bannedCountries` list.
///
/// This function is part of the 'country_listing.dart' file.
Widget buildCountryList(Function deleteCountry) {
  return ListView.builder(
    itemCount: Countries.bannedCountries.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(Countries.bannedCountries[index]),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red[400]),
          onPressed: () => deleteCountry(index, Countries.bannedCountries[index]),
        ),
      );
    },
  );
}