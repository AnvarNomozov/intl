import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  title(String val) {
    switch (val) {
      case 'ru':
        return const Text(
          'Russian',
          style: TextStyle(fontSize: 16.0),
        );
      case 'en':
        return const Text(
          "English",
          style: TextStyle(fontSize: 16.0),
        );

      case 'uz':
        return const Text(
          'Uzbek',
          style: TextStyle(fontSize: 16.0),
        );

      default:
        return const Text(
          'Uzbek',
          style: TextStyle(fontSize: 16.0),
        );
    }
  }
}
