import 'package:flutter/material.dart';
import 'DetailsPage.dart';

class EatingHabitsPage extends StatefulWidget {
  @override
  _EatingHabitsPageState createState() => _EatingHabitsPageState();
}

class _EatingHabitsPageState extends State<EatingHabitsPage> {
  String? _breakfastRegularly;
  String? _dailyFruits;
  String? _dailyVegetables;
  String? _dailyCarbs;
  Map<String, String> _eatingHabits = {};

  void _submitForm() {
    _eatingHabits = {
      'Do you eat breakfast regularly?': _breakfastRegularly ?? '',
      'How much fruits do you take daily?': _dailyFruits ?? '',
      'How much vegetables do you consume daily?': _dailyVegetables ?? '',
      'How many servings of rice, wheat, or bread do you eat per day?': _dailyCarbs ?? '',
    };
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage(eatingHabitsDetails: _eatingHabits)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eating Habits'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQuestion('Do you eat breakfast regularly?', [
              _buildButton('Yes', () {
                setState(() {
                  _breakfastRegularly = 'Yes';
                });
              }),
              _buildButton('No', () {
                setState(() {
                  _breakfastRegularly = 'No';
                });
              }),
            ]),
            _buildQuestion('How much fruits do you take daily?', [
              _buildButton('None', () {
                setState(() {
                  _dailyFruits = 'None';
                });
              }),
              _buildButton('1-2 servings', () {
                setState(() {
                  _dailyFruits = '1-2 servings';
                });
              }),
              _buildButton('3-4 servings', () {
                setState(() {
                  _dailyFruits = '3-4 servings';
                });
              }),
            ]),
            _buildQuestion('How much vegetables do you consume daily?', [
              _buildButton('0-1 servings', () {
                setState(() {
                  _dailyVegetables = '0-1 servings';
                });
              }),
              _buildButton('2-3 servings', () {
                setState(() {
                  _dailyVegetables = '2-3 servings';
                });
              }),
              _buildButton('4-5 servings', () {
                setState(() {
                  _dailyVegetables = '4-5 servings';
                });
              }),
            ]),
            _buildQuestion('How many servings of rice, wheat, or bread do you eat per day?', [
              _buildButton('One cup', () {
                setState(() {
                  _dailyCarbs = 'One cup';
                });
              }),
              _buildButton('Two cups', () {
                setState(() {
                  _dailyCarbs = 'Two cups';
                });
              }),
              _buildButton('More than 2 cups', () {
                setState(() {
                  _dailyCarbs = 'More than 2 cups';
                });
              }),
            ]),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(String question, List<Widget> buttons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Wrap(
          spacing: 12.0,
          children: buttons,
        ),
        SizedBox(height: 24.0),
      ],
    );
  }

  Widget _buildButton(String text, void Function()? onPressed) {
    bool isSelected = false;

    switch (text) {
      case 'Yes':
        isSelected = _breakfastRegularly == 'Yes';
        break;
      case 'No':
        isSelected = _breakfastRegularly == 'No';
        break;
      case 'None':
        isSelected = _dailyFruits == 'None';
        break;
      case '1-2 servings':
        isSelected = _dailyFruits == '1-2 servings';
        break;
      case '3-4 servings':
        isSelected = _dailyFruits == '3-4 servings';
        break;
      case '0-1 servings':
        isSelected = _dailyVegetables == '0-1 servings';
        break;
      case '2-3 servings':
        isSelected = _dailyVegetables == '2-3 servings';
        break;
      case '4-5 servings':
        isSelected = _dailyVegetables == '4-5 servings';
        break;
      case 'One cup':
        isSelected = _dailyCarbs == 'One cup';
        break;
      case 'Two cups':
        isSelected = _dailyCarbs == 'Two cups';
        break;
      case 'More than 2 cups':
        isSelected = _dailyCarbs == 'More than 2 cups';
        break;
      default:
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(isSelected ? Colors.green : Colors.white),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
