import 'package:flutter/material.dart';
import 'ExerciseDetailsPage.dart';

class ExerciseHabitsPage extends StatefulWidget {
  @override
  _ExerciseHabitsPageState createState() => _ExerciseHabitsPageState();
}

class _ExerciseHabitsPageState extends State<ExerciseHabitsPage> {
  String? _exerciseHabit;
  String? _exerciseFrequency;
  List<String> _exerciseTypes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Habits'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Do you have the habit of doing exercise or involving in play activities?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _buildRadioTile('Yes', 'yes'),
          _buildRadioTile('No', 'no'),
          SizedBox(height: 24.0),
          if (_exerciseHabit == 'yes') ...[
            Text(
              'How often do you exercise for at least twenty minutes apart from your daily work?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildFrequencyRadioTile('Every day', 'everyday'),
            _buildFrequencyRadioTile('More than three times a week', 'more_than_three'),
            _buildFrequencyRadioTile('Once or twice a week', 'once_or_twice'),
            _buildFrequencyRadioTile('Never', 'never'),
            SizedBox(height: 24.0),
            Text(
              'What type of exercise do you do?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildCheckbox('Brisk walking'),
            _buildCheckbox('Jogging'),
            _buildCheckbox('Swimming'),
            _buildCheckbox('Playing shuttle'),
            SizedBox(height: 24.0),
          ],
          ElevatedButton(
            onPressed: (_exerciseHabit == 'yes' && _exerciseFrequency != null && _exerciseTypes.isNotEmpty) ||
                _exerciseHabit == 'no'
                ? _submitForm
                : null,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioTile(String title, String value) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: _exerciseHabit,
      onChanged: (selectedValue) {
        setState(() {
          _exerciseHabit = selectedValue as String?;
          _exerciseFrequency = null;
          _exerciseTypes.clear();
        });
      },
    );
  }

  Widget _buildFrequencyRadioTile(String title, String value) {
    return RadioListTile(
      title: Text(title),
      value: value,
      groupValue: _exerciseFrequency,
      onChanged: (selectedValue) {
        setState(() {
          _exerciseFrequency = selectedValue as String?;
        });
      },
    );
  }

  Widget _buildCheckbox(String title) {
    return CheckboxListTile(
      title: Text(title),
      value: _exerciseTypes.contains(title),
      onChanged: (selected) {
        setState(() {
          if (selected!) {
            _exerciseTypes.add(title);
          } else {
            _exerciseTypes.remove(title);
          }
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> exerciseData = {
      'exerciseHabit': _exerciseHabit,
      'exerciseFrequency': _exerciseFrequency,
      'exerciseTypes': _exerciseTypes,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExerciseDetailsPage(
          exerciseData: exerciseData,
        ),
      ),
    );
  }

}
