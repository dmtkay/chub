import 'package:flutter/material.dart';

/// Observer used to notify the caller when the locale changes.
class LocaleObserver extends WidgetsBindingObserver {
  final void Function(List<Locale>? locales) _didChangeLocales;

  LocaleObserver(this._didChangeLocales);

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
