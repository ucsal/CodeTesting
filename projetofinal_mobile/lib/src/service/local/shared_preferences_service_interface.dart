abstract class ISharedPreferencesService {
  void saveLogin(bool value);
  Future<bool> readLogin();
  void saveToken(String value);
  Future<String> readToken();
  void saveUserId(int value);
  Future<int> readUserId();
  void saveUserRole(String value);
  Future<String> readUserRole();
}
