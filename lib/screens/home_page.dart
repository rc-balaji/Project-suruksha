import 'package:flutter/material.dart';
import 'package:nes/screens/RavinScreens/screens/admin_details_entry_page.dart';
import 'patient_login_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suruksha App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Suruksha',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminDetailsEntryPage()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 16),
                  Text('Admin Login'),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientLoginScreen()),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_circle),
                  SizedBox(width: 16),
                  Text('Patient Login'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
