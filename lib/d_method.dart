library d_method;

import 'dart:math';

class DMethod {
  /// limit for styling color text console
  static const String _limitColor = '\u001b[0m';

  /// print in console with custom color
  /// colorCode must be 0-255\
  static void printBasic(String body, [int colorCode = 178]) {
    print("$_limitColor\u001b[38;5;${colorCode}m$body$_limitColor");
  }

  /// print in console with line and color style\
  /// code must be 0-255\
  /// Default:\
  /// lineCount = 60\
  /// titleCode = 172\
  /// bodyCode = 178\
  /// maxBodyChar = 300\
  /// showAllDataBody: false
  static void printTitle(
    String title,
    String body, {
    int? lineCount,
    int? titleCode,
    int? bodyCode,
    int? maxBodyChar,
    bool showAllDataBody = false,
  }) {
    int newMaxBodyChar = maxBodyChar ?? 300;
    String newBody = showAllDataBody
        ? body
        : body.length > newMaxBodyChar
            ? body.substring(0, newMaxBodyChar)
            : body;
    String underLine =
        "$_limitColor\u001b[38;5;244m${'_' * (lineCount ?? 60)}$_limitColor";
    String upperLine =
        "$_limitColor\u001b[38;5;244m${'‾' * (lineCount ?? 60)}$_limitColor";
    print(underLine);
    print("$_limitColor\u001b[38;5;${titleCode ?? 178}m$title$_limitColor");
    print("$_limitColor\u001b[38;5;${bodyCode ?? 142}m$newBody$_limitColor");
    print(upperLine);
  }

  /// convert Byte value to MegaByte value
  static double byteToMb(int byte) {
    double kb = byte / 1024;
    double mb = kb / 1024;
    return mb;
  }

  /// count distance beetween 2 coordinate in km (kilometer)
  static double coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  /// set digit number
  /// if decimal equal to "0" then auto return int number as String
  static String numberAutoDigit(double value, [int maxDigit = 3]) {
    if (value.toInt() == value) {
      return value.toInt().toString();
    } else {
      int digit = value.toString().split('.').last.length;
      if (digit > maxDigit) return value.toStringAsFixed(maxDigit);
      return value.toString();
    }
  }
}
