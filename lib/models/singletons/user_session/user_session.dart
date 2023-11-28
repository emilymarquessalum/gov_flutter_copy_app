





import 'package:gov_flutter_copy_app/requests/backend_response.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_relatory.dart';
import 'package:gov_flutter_copy_app/views/professional_information/data_classes/user_professional_information.dart';

import 'preferences_session_source.dart';
import 'session_saver.dart';

// simple instantiation
SessionSource getUserSession() {
  return PinguimTemporaryUserSession(
    sessionDataManager: PreferencesSessionSource(),
  );
}

// Saves session data with a strategic source of data manager
// May define user type behaviour differentiation and validation
class PinguimTemporaryUserSession implements SessionSource {

  Map<String, dynamic>? userInformation;

  // Decorator pattern
  SessionSource sessionDataManager;


  PinguimTemporaryUserSession({
    required this.sessionDataManager,
  });

  @override
  bool isValidSessionData(Map<String, dynamic> confirmedSession) {
    return
      confirmedSession.isNotEmpty &&
      sessionDataManager.isValidSessionData(confirmedSession);
  }

  @override
  saveSession(confirmedSession) async {

    userInformation = confirmedSession;

    sessionDataManager.saveSession(userInformation!);

  }

  loadSession() async {
    return sessionDataManager.loadSession();
  }

  @override
  Future<bool> hasActiveSession() async {
    return userInformation != null;
  }

  @override
  void clearSession() {
    userInformation = null;
    sessionDataManager.clearSession();
  }





}



