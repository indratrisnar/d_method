# d_view

D'View is a package that provides wigdet for response and other basic needs in a concise way.

## Screenshot
<img src="https://github.com/indratrisnar/d_view/raw/master/pic/d_view1.png" alt="dview_1" height="540">
<img src="https://github.com/indratrisnar/d_view/raw/master/pic/d_view2.png" alt="dview_2" height="540">

## Usage

1. Response
```dart
DView.empty(),
DView.error(),
DView.loadingBar(),
DView.loadingCircle(),
```

2. Box
spaceHeight() inside Column
spaceWidth() inside Row
```dart
DView.spaceHeight(),
DView.spaceWidth(8),
```

3. Text
```dart
DView.textTitle("D'View"),
DView.textAction(
    () {
        print('click See All 2');
    },
    text: 'SEMUA',
    size: 20,
    iconRight: Icons.navigate_next,
),
```

# Tutorial :
[Watch](https://www.youtube.com/watch?v=ElfN1Fn8v3U)

Support me for more feature & packages
[Donate](https://www.paypal.com/paypalme/indratrisnar)

Check my app : [Visit](https://indratrisnar.github.io/projects.html)

Check My Tutorial & Course : [Watch](https://www.youtube.com/channel/UC0d_xINEvCtlDCpWfBpnYpA)