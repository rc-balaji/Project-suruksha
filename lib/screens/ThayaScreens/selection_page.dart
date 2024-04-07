import 'package:flutter/material.dart';
import 'eating_habits.dart';
import 'smoking_alcoholism.dart';
import 'exercise_habits.dart';
import 'sleeping_habits.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Category'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildListTile(context, 'Eating Habits', EatingHabitsPage()),
          _buildListTile(context, 'Smoking & Alcoholism', SmokingAlcoholismPage()),
          _buildListTile(context, 'Exercise Habits', ExerciseHabitsPage()),
          _buildListTile(context, 'Sleeping Habits', SleepingHabitsPage()),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
