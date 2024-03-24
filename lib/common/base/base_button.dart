import 'dart:ui';

abstract class BaseButton {
  double? get width;
  double? get height;
  String get text;
  void Function()? get onPressed;
  bool get enabled;
  Color get textColor;
  Color get backgroundColor;
  Color get borderColor;
}