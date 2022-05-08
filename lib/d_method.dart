library d_method;

import 'dart:math';

class DMethod {
  /// print in console
  static void printBasic(String body) => print(body);

  /// print in console with line style
  static void printTitle(String title, String body) {
    printBasic('_' * 80);
    printBasic('===> ' + title);
    printBasic('===> ' + body);
    printBasic('=' * 80);
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
}
