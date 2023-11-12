library d_method;

import 'dart:math';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Utility method
class DMethod {
  /// limit for styling color text console
  static const String _limitColor = '\u001b[0m';
  static const String _resetColor = '\x1B[0m';

  static String _ansiForegroundColor(int? code) {
    if (code == null) return '';
    return '\x1B[38;5;${code}m';
  }

  static String _getLine(String char) {
    return '${_ansiForegroundColor(244)}${char * 60}$_resetColor';
  }

  /// log for debug mode\
  /// with color customize
  static void log(String message, {int? colorCode}) {
    developer.log(
      '${_ansiForegroundColor(colorCode)}$message$_resetColor',
      name: 'DMethod',
    );
  }

  /// log for 2 line string
  /// with color customize\
  /// `maxBodyChar` : max character to show, default: full\
  /// `titleCode` color of title
  /// `bodyCode` color of body
  static void logTitle(
    String title,
    String body, {
    int? titleCode,
    int? bodyCode,
    int? maxBodyChar,
  }) {
    developer.log(_getLine('‾'), name: 'DMethod');
    developer.log(
      '${_ansiForegroundColor(titleCode)}$title$_resetColor',
      name: 'DMethod',
    );
    developer.log(
      '${_ansiForegroundColor(bodyCode)}$body$_resetColor',
      name: 'DMethod',
    );
    developer.log(_getLine('_'), name: 'DMethod');
  }

  /// log for debug response `http` package\
  /// with color customize\
  /// `maxBodyChar` : max character to show, default: full\
  /// `titleCode` color of title
  /// `bodyCode` color of body
  static void logResponse(
    http.Response response, {
    int? titleCode,
    int? bodyCode,
    int? maxBodyChar,
  }) {
    String method = response.request!.method;
    String url = response.request!.url.toString();
    int statusCode = response.statusCode;
    String title = "$method | $url | $statusCode";
    String body = response.body;
    String newBody =
        maxBodyChar == null ? body : body.substring(0, maxBodyChar);
    developer.log(_getLine('‾'), name: 'DMethod');
    developer.log(
      '${_ansiForegroundColor(titleCode)}$title$_resetColor',
      name: 'DMethod',
    );
    developer.log(
      '${_ansiForegroundColor(bodyCode)}$newBody$_resetColor',
      name: 'DMethod',
    );
    developer.log(_getLine('_'), name: 'DMethod');
  }

  /// print in console with custom color
  /// colorCode must be 0-255\
  static void printBasic(String body, [int colorCode = 172]) {
    debugPrint("$_limitColor\u001b[38;5;${colorCode}m$body$_limitColor");
  }

  /// print in console with line and color style\
  /// code must be 0-255 (for color)\
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
    debugPrint(underLine);
    debugPrint(
        "$_limitColor\u001b[38;5;${titleCode ?? 178}m$title$_limitColor");
    debugPrint(
        "$_limitColor\u001b[38;5;${bodyCode ?? 142}m$newBody$_limitColor");
    debugPrint(upperLine);
  }

  /// print in console with style for Response http access\
  /// code must be 0-255 (for color)\
  /// Default:\
  /// lineCount = 60\
  /// titleCode = 172\
  /// bodyCode = 178\
  /// maxBodyChar = 300\
  /// showAllDataBody: false
  static void printResponse(
    http.Response response, {
    String? prefix,
    int? lineCount,
    int? titleCode,
    int? bodyCode,
    int? maxBodyChar,
    bool showAllDataBody = false,
  }) {
    String method = response.request!.method;
    String url = response.request!.url.toString();
    int statusCode = response.statusCode;
    String title = "${prefix ?? 'Response: '}$method | $url | $statusCode";
    String body = response.body;
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
    debugPrint(underLine);
    debugPrint(
        "$_limitColor\u001b[38;5;${titleCode ?? 178}m$title$_limitColor");
    debugPrint(
        "$_limitColor\u001b[38;5;${bodyCode ?? 142}m$newBody$_limitColor");
    debugPrint(upperLine);
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

  /// DT: DateTime\
  /// to check is between datetime
  // static bool isBetweenDT(DateTime data, DateTime start, DateTime end) {
  //   return data.isBefore(start) && data.isAfter(end);
  // }
}
