





/// #TODO -> Add Listener Behaviour
abstract class SessionSource {
  Future saveSession(Map<String, dynamic> confirmedSession);

  bool isValidSessionData(Map<String, dynamic> confirmedSession);


  Future loadSession();


  Future<bool> hasActiveSession();

  void clearSession();
}