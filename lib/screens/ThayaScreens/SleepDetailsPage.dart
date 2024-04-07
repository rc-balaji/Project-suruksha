import 'package:flutter/material.dart';

class SleepDetailsPage extends StatelessWidget {
  final Map<String, String?> sleepData;

  const SleepDetailsPage({Key? key, required this.sleepData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Details'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Sleep Quality'),
            subtitle: Text(sleepData['sleepQuality'] ?? 'N/A'),
          ),
          ListTile(
            title: Text('Undisturbed Sleep Hours'),
            subtitle: Text(sleepData['undisturbedSleepHours'] ?? 'N/A'),
          ),
          ListTile(
            title: Text('Nap Duration'),
            subtitle: Text(sleepData['napDuration'] ?? 'N/A'),
          ),
        ],
      ),
    );
  }
}
