
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setTerminalId(String terminalId){
     _prefs.setString("terminalId", terminalId);
  }

  static String getTerminalId(){
    return _prefs.getString("terminalId")??"0";
  }

  static void removeTerminalId(){
    _prefs.remove("terminalId");
  }

  static String getUserId() {
    return _prefs.getString('userId') ?? '';
  }

  static void setUserId(String userId) {
    _prefs.setString('userId', userId);
  }

  static void clearUserId() {
    _prefs.remove('userId');
  }

}
