# Rulers

A Flutter Widget to show Ruler with selected values
<a href="https://github.com/theshivamlko/rulers_flutter_example"><b>Example code is here</b></a>

<img src="https://raw.githubusercontent.com/theshivamlko/rulers_flutter_package/master/rulers.gif" width="220" alt="Flutter Rulers" />
<br/><br/>

## Getting Started
### Include
You should ensure that you add the following dependency in your Flutter project.
```yaml
dependencies:
 rulers: "^1.0.5"
```
You should then run `flutter packages get` in terminal.

### Import
In your Dart code, to use it:
```dart
import 'package:rulers/rulers.dart';
```

### Example
In your Dart code, to use it:
```
        Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: RulerWidget(
                    height: 100,
                    scaleBackgroundColor: Colors.yellow,
                    indicatorWidget: Image.asset(
                         'assets/marker.png',
                          color: Colors.red,
                          height: 25,
                          width: 25,
                        ),
                    largeScaleBarsInterval: 24,
                    smallScaleBarsInterval: 3,
                    lowerIndicatorLimit: 2, 
                    upperIndicatorLimit: 8,
                    barsColor: Colors.grey,
                    inRangeBarColor: Colors.green,
                    behindRangeBarColor: Colors.orangeAccent,
                    outRangeBarColor: Colors.red,
                  ),
                ),
```

## Project Created & Maintained By

### Shivam Srivastava
 
<a href="https://linkedin.com/in/theshivamlko"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>
<a href="https://twitter.com/navokitech"><img src="https://github.com/aritraroy/social-icons/blob/master/twitter-icon.png?raw=true" width="60"></a>
<a href="https://facebook.com/navokitech"><img src="https://github.com/aritraroy/social-icons/blob/master/facebook-icon.png?raw=true" width="60"></a>
<a href="https://instagram.com/navokitech"><img src="https://github.com/aritraroy/social-icons/blob/master/instagram-icon.png?raw=true" width="60"></a>


For help getting started with Flutter, view our online
[documentation](https://flutter.dev/docs/get-started/install).
