import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'patient_profile_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
              ),
              obscureText: !_showPassword,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(_showConfirmPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _showConfirmPassword = !_showConfirmPassword;
                    });
                  },
                ),
              ),
              obscureText: !_showConfirmPassword,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_passwordController.text == _confirmPasswordController.text) {
                  final userProvider = Provider.of<UserProvider>(context, listen: false);
                  userProvider.addUser({
                    'username': _usernameController.text,
                    'password': _passwordController.text,
                    'name': '',
                    'age': '',
                    'gender': '',
                    'maritalStatus': '',
                    'occupation': '',
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PatientProfilePage(username: _usernameController.text,password:_passwordController.text)));
                } else {
                  setState(() {
                    _errorMessage = 'Passwords do not match.';
                  });
                }
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 10.0),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
