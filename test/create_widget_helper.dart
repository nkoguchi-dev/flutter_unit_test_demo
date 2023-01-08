import 'package:flutter/material.dart';

class CreateWidgetHelper {
  static MaterialApp createTestApp(
    Widget child, {
    List<NavigatorObserver> navigatorObservers = const [],
  }) {
    return MaterialApp(
      home: child,
      navigatorObservers: navigatorObservers,
    );
  }
}
