import 'dart:convert';

class Utility {
  static bool isSet(String? s) {
    if (s != null) {
      if (s != '') {
        if (s.isNotEmpty) {
          if (s.isNotEmpty) {
            return true;
          }
        }
      }
    }
    return false;
  }

  static String jsonToString(dynamic obj) {
    return jsonEncode(obj);
  }

  static dynamic stringToJson(String obj) {
    return jsonDecode(obj);
  }
}
