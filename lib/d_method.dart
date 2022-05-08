library d_method;

import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class DMethod {
  // ignore: avoid_print
  static void printBasic(String body) => print(body);

  static void printTitle(String title, String body) {
    printBasic('_' * 80);
    printBasic('===> ' + title);
    printBasic('===> ' + body);
    printBasic('=' * 80);
  }

  static double byteToMb(int byte) {
    double kb = byte / 1024;
    double mb = kb / 1024;
    return mb;
  }

  static Future<bool> launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      printBasic('Cannot launch url');
      return false;
    }
    return true;
  }

  static Future<bool> launchMap(
    double latitude,
    double longitude,
    String? label,
  ) async {
    return await MapsLauncher.launchCoordinates(latitude, longitude, label);
  }
}
