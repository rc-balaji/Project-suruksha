import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, String> eatingHabitsDetails;

  const DetailsPage({Key? key, required this.eatingHabitsDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eating Habits Details'),
      ),
      body: ListView.builder(
        itemCount: eatingHabitsDetails.length,
        itemBuilder: (context, index) {
          String key = eatingHabitsDetails.keys.elementAt(index);
          return ListTile(
            title: Text(key),
            subtitle: Text(eatingHabitsDetails[key]!),
          );
        },
      ),
    );
  }
}
