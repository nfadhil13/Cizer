library cizer;


import 'package:flutter/material.dart';

part 'cizer_size.dart';

part 'cizer_screen.dart';

part 'max_width_container.dart';

part 'cizer_app.dart';

part 'responsive_item.dart';

part 'responsive_layout.dart';


class Cizer {
  static double _phoneBreakPoint = 576.0;
  static double _tabletBreakPoint = 992.0;
  static double _maximumBreakPoint = 1400.0;
  static double _height = 0;
  static double _width = 0;
  static CizerScreen _screen = CizerScreen.phone;


  static double get phone  => _phoneBreakPoint;

  static double get tablet => _tabletBreakPoint;

  static double get maximum => _maximumBreakPoint;


  static double get height => _height;

  static double get width => _width;

  static CizerScreen get screen => _screen;

  static bool get isMobile => _screen == CizerScreen.phone;

  static bool get isTablet => _screen == CizerScreen.tablet;

  static bool get isDesktop => _screen == CizerScreen.desktop;


  static void init(
      double height,
      double width,
      {double? phoneBreakPoint, double? tabletBreakPoint, double? maximumBreakPoint}
      ){
    _phoneBreakPoint = phoneBreakPoint ?? _phoneBreakPoint;
    _tabletBreakPoint = tabletBreakPoint ?? _tabletBreakPoint;
    _maximumBreakPoint = maximumBreakPoint ?? _maximumBreakPoint;
    _height = height;
    _width = width;
    _screen = _getCurrentScreen();
  }

  static CizerScreen _getCurrentScreen(){
    if(_width < Cizer.phone){
      return CizerScreen.phone;
    }else if(_width >= Cizer.phone && _width < Cizer.tablet){
      return CizerScreen.tablet;
    }
    return CizerScreen.desktop;
  }




}