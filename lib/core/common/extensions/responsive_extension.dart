import 'package:flutter/material.dart';

/// An extension method that adds the `isMobile`, `isTablet`, and `isDesktop` properties to the
/// `BoxConstraints` class.
extension ResponsiveConstraint on BoxConstraints {
  bool get isMobile => smallest.shortestSide < 600; 
  bool get isTablet => smallest.shortestSide >= 600 && smallest.shortestSide < 900;
  bool get isDesktop => smallest.shortestSide >= 900;

  double get scale {
    if (isDesktop) {
      return 1.25;
    } else if (isTablet) {
      return 1.15;
    } else {
      return 1;
    } 
  }
}