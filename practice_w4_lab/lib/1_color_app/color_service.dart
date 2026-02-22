import 'package:flutter/material.dart';

enum CardType { red, green, yellow, blue }

extension CardTypeExtension on CardType {
  Color get color {
    switch (this) {
      case CardType.red:
        return Colors.red;
      case CardType.green:
        return Colors.green;
      case CardType.yellow:
        return Colors.yellow;
      case CardType.blue:
        return Colors.blue;
    }
  }

  String get label {
    switch (this) {
      case CardType.red:
        return 'red';
      case CardType.green:
        return 'green';
      case CardType.yellow:
        return 'yellow';
      case CardType.blue:
        return 'blue';
    }
  }
}

final colorService = ColorService();

class ColorService extends ChangeNotifier {
  final Map<CardType, int> _tapCounts = {
    CardType.red: 0,
    CardType.green: 0,
    CardType.yellow: 0,
    CardType.blue: 0,
  };

  Map<CardType, int> get tapCounts => Map.unmodifiable(_tapCounts);

  int getTapCount(CardType type) => _tapCounts[type]!;

  void increment(CardType type) {
    _tapCounts[type] = _tapCounts[type]! + 1;
    notifyListeners();
  }
}
