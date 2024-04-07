import 'package:flutter/material.dart';

class SmokeDetails extends StatelessWidget {
  final Map<String, String?> details;

  const SmokeDetails({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(
        children: details.entries.map((entry) {
          return ListTile(
            title: Text(entry.key),
            subtitle: Text(entry.value ?? 'Not provided'),
          );
        }).toList(),
      ),
    );
  }
}
