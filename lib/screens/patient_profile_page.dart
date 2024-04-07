import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'patient_login_screen.dart';
import '../providers/user_provider.dart';

class PatientProfilePage extends StatefulWidget {
  final String username;
  final String password;
  PatientProfilePage({required this.username, required this.password});

  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _maritalStatusController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Gender',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _maritalStatusController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Marital Status',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _occupationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Occupation',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => saveProfile(context),
              child: Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void saveProfile(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Map<String, String> userDetails = {
      'username': widget.username,
      'password':widget.password,
      'name': _nameController.text,
      'age': _ageController.text,
      'gender': _genderController.text,
      'maritalStatus': _maritalStatusController.text,
      'occupation': _occupationController.text,
    };

    userProvider.updateUser(widget.username, userDetails);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => PatientLoginScreen()),
          (Route<dynamic> route) => false,
    );
  }
}
