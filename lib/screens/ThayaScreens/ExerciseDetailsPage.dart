import 'package:flutter/material.dart';

class ExerciseDetailsPage extends StatelessWidget {
  final Map<String, dynamic> exerciseData;

  const ExerciseDetailsPage({
    Key? key,
    required this.exerciseData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> exerciseTypes = List<String>.from(exerciseData['exerciseTypes']);

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Habits Details'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Exercise Habit'),
            subtitle: Text(exerciseData['exerciseHabit'] ?? 'N/A'),
          ),
          ListTile(
            title: Text('Exercise Frequency'),
            subtitle: Text(exerciseData['exerciseFrequency'] ?? 'N/A'),
          ),
          ListTile(
            title: Text('Exercise Types'),
            subtitle: Text(exerciseTypes.isNotEmpty ? exerciseTypes.join(', ') : 'N/A'),
          ),
        ],
      ),
    );
  }
}
