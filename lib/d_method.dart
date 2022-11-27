library d_method;

import 'dart:math';

class DMethod {
  /// print in console
  static void printBasic(String body) => print(body);

  /// limit for styling color text console
  static const String _limitColor = '\u001b[0m';

  /// print in console with line and color style\
  /// code must be 0-255\
  /// Default:\
  /// lineCount = 60\
  /// titleCode = 172\
  /// bodyCode = 178
  /// maxBodyChar = 200
  static void printTitle(
    String title,
    String body, {
    int? lineCount,
    int? titleCode,
    int? bodyCode,
    int? maxBodyChar,
  }) {
    int newMaxBodyChar = maxBodyChar ?? 200;
    String newBody =
        body.length > newMaxBodyChar ? body.substring(1, newMaxBodyChar) : body;
    String underLine =
        "$_limitColor\u001b[38;5;244m${'_' * (lineCount ?? 60)}$_limitColor";
    String upperLine =
        "$_limitColor\u001b[38;5;244m${'‾' * (lineCount ?? 60)}$_limitColor";
    printBasic(underLine);
    printBasic(
        "$_limitColor\u001b[38;5;${titleCode ?? 178}m$title" + _limitColor);
    printBasic(
        "$_limitColor\u001b[38;5;${bodyCode ?? 142}m$newBody" + _limitColor);
    printBasic(upperLine);
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
