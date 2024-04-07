
import 'package:flutter/material.dart';
import 'smoke_detail.dart';
class SmokingAlcoholismPage extends StatefulWidget {
  @override
  _SmokingAlcoholismPageState createState() => _SmokingAlcoholismPageState();
}

class _SmokingAlcoholismPageState extends State<SmokingAlcoholismPage> {
  String? _smokingHabit; // State variable to track the selected smoking habit
  String? _yearsSmoking;
  String? _yearsStopped;
  String? _cigarettesPerDay;
  String? _drinkingHabit;
  String? _drinkingFrequency;

  bool get canSubmit {
    if (_smokingHabit == 'never') {
      return true; // Allow submission if "Never smoked" is selected
    } else if (_smokingHabit == 'stopped' && _yearsSmoking != null && _yearsStopped != null) {
      return true; // Allow submission if "Stopped smoking" is selected and years questions are answered
    } else if (_smokingHabit == 'still' && _cigarettesPerDay != null) {
      return true; // Allow submission if "Still smoking" is selected and cigarettes per day is chosen
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smoking & Alcoholism'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text('How would you describe your cigarette smoking habits?'),
          RadioListTile(
            title: Text('Never smoked'),
            value: 'never',
            groupValue: _smokingHabit,
            onChanged: (value) {
              setState(() {
                _smokingHabit = value as String?;
                if (_smokingHabit == 'never') {
                  _yearsSmoking = null;
                  _yearsStopped = null;
                  _cigarettesPerDay = null;
                }
              });
            },
          ),
          RadioListTile(
            title: Text('Stopped smoking'),
            value: 'stopped',
            groupValue: _smokingHabit,
            onChanged: (value) {
              setState(() {
                _smokingHabit = value as String?;
                _cigarettesPerDay = null; // Reset cigarettes per day
              });
            },
          ),
          if (_smokingHabit == 'stopped') ...[
            SizedBox(height: 16.0),
            Text('How many years has it been since you started smoking?'),
            RadioListTile(
              title: Text('Less than 1 year'),
              value: 'less_than_1_year',
              groupValue: _yearsSmoking,
              onChanged: (value) {
                setState(() {
                  _yearsSmoking = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('1-5 years'),
              value: '1-5_years',
              groupValue: _yearsSmoking,
              onChanged: (value) {
                setState(() {
                  _yearsSmoking = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('6-15 years'),
              value: '6-15_years',
              groupValue: _yearsSmoking,
              onChanged: (value) {
                setState(() {
                  _yearsSmoking = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('More than 15 years'),
              value: 'more_than_15_years',
              groupValue: _yearsSmoking,
              onChanged: (value) {
                setState(() {
                  _yearsSmoking = value as String?;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('How long has it been since you stopped smoking?'),
            RadioListTile(
              title: Text('Less than 6 months'),
              value: 'less_than_6_months',
              groupValue: _yearsStopped,
              onChanged: (value) {
                setState(() {
                  _yearsStopped = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('7 months - 1 year'),
              value: '7_months_1_year',
              groupValue: _yearsStopped,
              onChanged: (value) {
                setState(() {
                  _yearsStopped = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('1-2 years'),
              value: '1-2_years',
              groupValue: _yearsStopped,
              onChanged: (value) {
                setState(() {
                  _yearsStopped = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('More than 2 years'),
              value: 'more_than_2_years',
              groupValue: _yearsStopped,
              onChanged: (value) {
                setState(() {
                  _yearsStopped = value as String?;
                });
              },
            ),
          ],
          RadioListTile(
            title: Text('Still smoking'),
            value: 'still',
            groupValue: _smokingHabit,
            onChanged: (value) {
              setState(() {
                _smokingHabit = value as String?;
                _yearsSmoking = null; // Reset years smoking
                _yearsStopped = null; // Reset years stopped
              });
            },
          ),
          if (_smokingHabit == 'still') ...[
            SizedBox(height: 16.0),
            Text('If you are still smoking, how many cigarettes a day do you smoke on average?'),
            RadioListTile(
              title: Text('One packet/day'),
              value: 'one_packet',
              groupValue: _cigarettesPerDay,
              onChanged: (value) {
                setState(() {
                  _cigarettesPerDay = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('2-3 packets'),
              value: '2-3_packets',
              groupValue: _cigarettesPerDay,
              onChanged: (value) {
                setState(() {
                  _cigarettesPerDay = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('More than 3 packets'),
              value: 'more_than_3_packets',
              groupValue: _cigarettesPerDay,
              onChanged: (value) {
                setState(() {
                  _cigarettesPerDay = value as String?;
                });
              },
            ),
          ],
          SizedBox(height: 16.0),
          Text('How would you describe your drinking habit?'),
          RadioListTile(
            title: Text('Never drink alcohol'),
            value: 'never',
            groupValue: _drinkingHabit,
            onChanged: (value) {
              setState(() {
                _drinkingHabit = value as String?;
                _drinkingFrequency = null; // Reset drinking frequency
              });
            },
          ),
          RadioListTile(
            title: Text('Stopped drinking alcohol'),
            value: 'stopped',
            groupValue: _drinkingHabit,
            onChanged: (value) {
              setState(() {
                _drinkingHabit = value as String?;
                _drinkingFrequency = null; // Reset drinking frequency
              });
            },
          ),
          RadioListTile(
            title: Text('Still consuming alcohol'),
            value: 'still',
            groupValue: _drinkingHabit,
            onChanged: (value) {
              setState(() {
                _drinkingHabit = value as String?;
                _drinkingFrequency = null; // Reset drinking frequency
              });
            },
          ),
          if (_drinkingHabit == 'still') ...[
            SizedBox(height: 16.0),
            Text('How often do you drink alcohol?'),
            RadioListTile(
              title: Text('Occasional'),
              value: 'occasional',
              groupValue: _drinkingFrequency,
              onChanged: (value) {
                setState(() {
                  _drinkingFrequency = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('Twice a week'),
              value: 'twice_a_week',
              groupValue: _drinkingFrequency,
              onChanged: (value) {
                setState(() {
                  _drinkingFrequency = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('Daily'),
              value: 'daily',
              groupValue: _drinkingFrequency,
              onChanged: (value) {
                setState(() {
                  _drinkingFrequency = value as String?;
                });
              },
            ),
            RadioListTile(
              title: Text('Daily even in morning of the day'),
              value: 'daily_morning',
              groupValue: _drinkingFrequency,
              onChanged: (value) {
                setState(() {
                  _drinkingFrequency = value as String?;
                });
              },
            ),
          ],
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: canSubmit ? _submitForm : null,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    Map<String, String?> details = {
      'Smoking Habit': _smokingHabit,
      'Years Smoking': _yearsSmoking,
      'Years Stopped': _yearsStopped,
      'Cigarettes Per Day': _cigarettesPerDay,
      'Drinking Habit': _drinkingHabit,
      'Drinking Frequency': _drinkingFrequency,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SmokeDetails(details: details),
      ),
    );
  }

}