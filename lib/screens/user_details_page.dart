import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'ThayaScreens/selection_page.dart'; // Make sure to import the SelectionPage

class UserDetailsPage extends StatelessWidget {
  final String username;

  UserDetailsPage({required this.username});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).getUser(username);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
        backgroundColor: theme.primaryColorDark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _userInfoCard("Username", user['username'] ?? 'N/A', theme),
              _userInfoCard("Name", user['name'] ?? 'N/A', theme),
              _userInfoCard("Age", user['age'] ?? 'N/A', theme),
              _userInfoCard("Gender", user['gender'] ?? 'N/A', theme),
              _userInfoCard("Marital Status", user['maritalStatus'] ?? 'N/A', theme),
              _userInfoCard("Occupation", user['occupation'] ?? 'N/A', theme),
              Padding(
                padding: EdgeInsets.only(top: 20), // Add some spacing at the top
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectionPage()),
                    );
                  },
                  child: Text('Start Questionnaire'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: theme.primaryColor, // Text color
                  ),
                ),
              ),
            ].map((widget) => Padding(padding: EdgeInsets.only(bottom: 10), child: widget)).toList(),
          ),
        ),
      ),
    );
  }

  Widget _userInfoCard(String title, String value, ThemeData theme) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "$title:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.primaryColorDark,
              ),
            ),
            Flexible(
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16,
                  color: theme.primaryColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
