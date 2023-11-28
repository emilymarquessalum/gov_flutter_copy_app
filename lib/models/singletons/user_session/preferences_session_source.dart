



import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'session_saver.dart';

// knows the package "UserPreferences" to save local data
class PreferencesSessionSource implements SessionSource  {

  final String _preferencesSessionKey = 'session'; // +userType.toString()

  const PreferencesSessionSource();

  @override
  bool isValidSessionData(Map<String, dynamic> confirmedSession) {

    /// this is just as an example, it never actually happens
    List<String> invalidSavingInputs = [
      "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBEb3VibGUu",
      "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBCaWdJbnRlZ2Vy",
      "VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu"
    ];

    for(String invalidInput in invalidSavingInputs) {
      if(confirmedSession.toString().startsWith(invalidInput)) {
        return false;
      }
    }

    return true;
  }

  @override
  Future saveSession(Map<String, dynamic> confirmedSession) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_preferencesSessionKey, jsonEncode(confirmedSession));
  }

  @override
  Future loadSession() async {

    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      return jsonDecode(preferences.getString(_preferencesSessionKey) ?? '{}');

    } catch(err) {

    }

    return null;
  }

  @override
  Future<bool> hasActiveSession() async {
    return (await loadSession()) != null;
  }

  @override
  void clearSession() {
    SharedPreferences.getInstance().then((preferences) =>
        preferences.remove(_preferencesSessionKey));
  }
}