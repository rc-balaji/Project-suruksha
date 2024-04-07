import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_details_page.dart';
import 'sign_up_page.dart';
import '../providers/user_provider.dart';

class PatientLoginScreen extends StatefulWidget {
  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Login'),
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
              obscureText: !_showPassword,
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
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => print('Forgot Password Clicked'),
                  child: Text('Forgot Password?'),
                ),
                Text('|'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    Map<String, String>? user = userProvider.getUser(username);
    print(user);
    if (user.isEmpty) {
      setState(() => _errorMessage = 'No user found.');
    } else if (user['password'] != password) {
      setState(() => _errorMessage = 'Password is incorrect.');
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDetailsPage(username: username),
        ),
      );
    }
  }
}
