import 'package:flutter/material.dart';

class Routes {
  static Route<T> asDefault<T extends Object>(Widget screen) {
    return MaterialPageRoute(
      builder:(context) {
        return screen;
      },
    );
  }
}