D'Method is package to get value from several compute, to faster build app.

## Usage

### Convert Byte

```dart
double size = DMethod.byteToMb(10123456);
DMethod.printTitle(
    'byteToMb',
    '${size.toStringAsFixed(2)} Mb',
);
```

### Check Response http

```dart
String url = 'https://jsonplaceholder.typicode.com/posts';
final response = await http.get(Uri.parse(url));
DMethod.printResponse(response);
```

<img src="https://github.com/indratrisnar/d_method/raw/master/pic/dmethod_print_response.png" alt="dmethod_printtitle" width="600">

### Log Console

```dart
DMethod.printTitle('http://drexappstudio/youtube','oooooo');
DMethod.printTitle('http://drexappstudio/youtube','oooooo',titleCode: 105);
DMethod.printTitle('http://drexappstudio/youtube','oooooo',titleCode: 105,bodyCode: 106);
```

<img src="https://github.com/indratrisnar/d_method/raw/master/pic/dmethod_print_title.png" alt="dmethod_printtitle" width="540">

Color Code\
<img src="https://github.com/indratrisnar/d_method/raw/master/pic/dmethod_print_title_color_code.png" alt="dmethod_printtitle_color_code" height="400">

### Tutorial :

-

Support me for more feature & packages
[Donate](https://www.paypal.com/paypalme/indratrisnar)

Check my app : [Visit](https://indratrisnar.github.io/projects.html)

Check My Tutorial & Course : [Watch](https://www.youtube.com/channel/UC0d_xINEvCtlDCpWfBpnYpA)
