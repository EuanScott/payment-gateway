import 'package:flutter/material.dart';
import '../utils/country_util.dart';


class CountryListPage extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryListPage> {
  TextEditingController controller = TextEditingController();

  void addCountry(String country) {
    setState(() {
      Countries.countries.add(country);
      Countries.countries.sort();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$country has been added to the list'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Listing'),
      ),
      body: ListView.builder(
        itemCount: Countries.countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(Countries.countries[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  Countries.countries.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
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
                      setState(() {
                        addCountry(controller.text);
                        controller.clear();
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}