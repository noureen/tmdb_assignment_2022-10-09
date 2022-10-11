import 'dart:convert';
import 'package:intl/intl.dart';

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

  static DateTime convertStrDateToDate(String dateTimeStr) {
    return DateFormat("yyyy-MM-dd").parse(dateTimeStr);
  }

  static String getDateByMonthName(DateTime dateTime) {
    return DateFormat("MMMM dd, yyyy").format(dateTime);
  }

}
