# Cizer
## Help you to be responsive 

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://github.com/nfadhil13/Cizer)

Cizer is Flutter package that help you to build a responsive app.This package is inspired by [Sizer]() and [Bootstrap]()

- Build Responsive text, height, and weight easily
- Use Breakpoint to make responsive easier

## Installation

##### Add the following imports to your Dart file where you want to use Cizer:
```dart
import 'package:cizer/cizer.dart';
```

##### Wrap MaterialApp with CizerApp widget
```dart
    return CizerApp(
        builder: (ctx) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        )
    );
```

##### Define your own breakpoint
Cizer using breakpoints(like bootstrap) as your helper to decide what to show on every breakpoint. We have 3 breakpoints used, the breakpoints and their default values are :
```dart
class BreakPoints {
  static const phone= 576.0;
  static const tablet = 992.0;
  static const maximum = 1400.0;
}
```


You can define your own value for each breakpoint in CizerApp initialization like this :
```dart
    return CizerApp(
        builder: (ctx) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
        phoneBreakPoint: 500,
        tabletBreakPoint: 1000,
        maximumBreakPoint: 1500,
    );
```

Note : Maximum breakpoint is used for MaxwidhtContainer

### Resoponsive Helper

* `.h`  Use it when you want your widget height/width relative to screen height
* `.w`  Use it when you want your widget height/width relative to screen Width
* `.sp` Text Size relative to screen width
* `Cizer.isMobile`  Return if current screen width is on mobile breakpoint
* `Cizer.isTablet`  Return if current screen width is on tablet breakpoint
* `Cizer.isDesktop`  Return if current screen width is on desktop breakpoint
* `Cizer.screen`  Return current screen state (Mobile, Tablet, or Desktop)
* `Cizer.break` Break the application


## How To Use ?

### The Not Effective Way (Avoid Const Widget)
The most "dirty" way of using Cizer is to avoid using const on any widget that using cizer inside it (like `Cizer.isDesktop` or `.sp`). Not only on the widget that using it, but also every parent that using the widget.

##### Why?
When A widget given a const,  Flutter will not rebuilt the widget, this cause the widget would not be responsive.

### The Effective Way (Able to use Const Widget)
If you choose to still using const for the sake of performance, then Cizer give you `ResponsiveLayout`  widget to wrap your widget that need to be responsive. When you are using `ResponsiveLayout` only the needed widget will be rebuilt, and you are still able to use const widget.
 
#### `ResponsiveLayout`
This is the default constructor of `ResponsiveLayout`.  You might use this class when you have excatly different things to show on every breakpoints. We are using mobile first principle, so the only required parameter are mobile body. 

Here is the example of using responsivelayout :
```dart
    return  ResponsiveLayout(
      mobileBody: () => const Text("Mobile Body"),
      tabletBody: () => const Text("Mobile Body"),
      desktopBody: () => const Text("Mobile Body"),
    );
```

There is an alternative constructor of `ResponsiveLayout`, it is  `ResponsiveLayout.freeBuild`.  You can use this, if you think the default constructor are to overkill or will result on boilerplate. 

Let's say  you want to change color of the text when your are on mobile breakpoint. Then if you are using default constructor it will be like this :

```dart
    return  ResponsiveLayout(
      mobileBody: () => const Text(
          "Random Text", style: TextStyle(color: Colors.red)
      ),
      tabletBody: () => const Text(
          "Random Text" , style:  TextStyle(color: Colors.blue)
      ),
      desktopBody: () => const Text("Random Text" , 
          style:  TextStyle(color: Colors.blue)
      ),
    );
```

With  `ResponsiveLayout.freeBuild` you can solve it with less code. Here is the way you might use when you are using `ResponsiveLayout.freeBuild` Constructor :

```dart
    return ResponsiveLayout.freeBuild(() =>
        Text("Random Text", 
          style: TextStyle(color: Cizer.isMobile ? Colors.red : Colors.blue)
        )
    );
```







