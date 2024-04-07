import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  List<Map<String, String>> _users = [];

  List<Map<String, String>> get users => _users;

  void addUser(Map<String, String> newUser) {
    int index = _users.indexWhere((user) => user['username'] == newUser['username']);
    if (index == -1) {
      _users.add(newUser);
    } else {
      _users[index] = newUser;
    }

    print(_users);
    notifyListeners();
  }

  Map<String, String> getUser(String username) {
    return _users.firstWhere(
          (user) => user['username'] == username,
      orElse: () => <String, String>{},
    );
  }

  void updateUser(String username, Map<String, String> updatedUser) {
    int index = _users.indexWhere((user) => user['username'] == username);

    print(_users);
    if (index != -1) {
      _users[index] = updatedUser;
      print(_users);
      notifyListeners();
    }
  }
}
