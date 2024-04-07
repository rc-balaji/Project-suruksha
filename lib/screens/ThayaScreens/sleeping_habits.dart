import 'package:flutter/material.dart';

import 'SleepDetailsPage.dart';

class SleepingHabitsPage extends StatefulWidget {
  @override
  _SleepingHabitsPageState createState() => _SleepingHabitsPageState();
}

class _SleepingHabitsPageState extends State<SleepingHabitsPage> {
  String? _sleepQuality;
  String? _undisturbedSleepHours;
  String? _napDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleeping Habits'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text('How do you describe your usual sleep?'),
          _buildRadioTile('Disturbed sleep', 'disturbed'),
          _buildRadioTile('Undisturbed sleep', 'undisturbed'),

          SizedBox(height: 16.0),

          Text('How many hours of undisturbed sleep do you have?'),
          _buildRadioTile('2-4 hrs', '2-4 hrs'),
          _buildRadioTile('4-6 hrs', '4-6 hrs'),

          SizedBox(height: 16.0),

          Text('How long do you nap?'),
          _buildRadioTile('More than one hour', '>1 hr'),
          _buildRadioTile('Less than one hour', '<1 hr'),

          SizedBox(height: 32.0),

          Center(
            child: ElevatedButton(
              onPressed: _canSubmit() ? _submitForm : null,
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String title, String value) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: _getGroupValue(title),
      onChanged: (selectedValue) {
        setState(() {
          _updateGroupValue(title, selectedValue);
        });
      },
    );
  }

  dynamic _getGroupValue(String title) {
    switch (title) {
      case 'Disturbed sleep':
      case 'Undisturbed sleep':
        return _sleepQuality;
      case '2-4 hrs':
      case '4-6 hrs':
        return _undisturbedSleepHours;
      case 'More than one hour':
      case 'Less than one hour':
        return _napDuration;
      default:
        return null;
    }
  }

  void _updateGroupValue(String title, dynamic selectedValue) {
    switch (title) {
      case 'Disturbed sleep':
      case 'Undisturbed sleep':
        _sleepQuality = selectedValue as String?;
        break;
      case '2-4 hrs':
      case '4-6 hrs':
        _undisturbedSleepHours = selectedValue as String?;
        break;
      case 'More than one hour':
      case 'Less than one hour':
        _napDuration = selectedValue as String?;
        break;
    }
  }

  bool _canSubmit() {
    return _sleepQuality != null &&
        _undisturbedSleepHours != null &&
        _napDuration != null;
  }

  void _submitForm() {
    final Map<String, String?> sleepData = {
      'sleepQuality': _sleepQuality,
      'undisturbedSleepHours': _undisturbedSleepHours,
      'napDuration': _napDuration,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SleepDetailsPage(
          sleepData: sleepData,
        ),
      ),
    );
  }

}
