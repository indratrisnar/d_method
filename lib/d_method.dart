library d_method;

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
}
