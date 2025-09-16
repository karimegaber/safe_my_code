import 'package:flutter/material.dart' show Color, Colors;

extension SafeStringExtension on String? {
  // Regular expressions for checking English and Arabic characters
  static final RegExp englishRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
  static final RegExp arabicRegex = RegExp(r'[\u0600-\u06FF]');

  // Arabic and English Numbers Strings
  static final Map<String, String> numbers = {
    "0": "٠",
    "1": "١",
    "2": "٢",
    "3": "٣",
    "4": "٤",
    "5": "٥",
    "6": "٦",
    "7": "٧",
    "8": "٨",
    "9": "٩",
  };

  /// A safe string representation of the object.
  /// Returns an empty string ('') if the object is null.
  String get safeString {
    if (this == null) {
      return "";
    }

    return toString();
  }

  /// A getter that returns `true` if the string is `null`.
  bool get safeIsNull => this == null;

  /// A getter that returns `true` if the string is not `null`.
  bool get safeIsNotNull => this != null;

  /// A getter that returns `true` if the string is either `null` or empty.
  bool get safeIsEmpty => this?.isEmpty ?? true;

  /// A getter that returns `true` if the string is not `null` and not empty.
  bool get safeIsNotEmpty => this?.isNotEmpty ?? false;

  /// A convenient getter that checks if the string is either empty or null.
  bool get isEmptyOrNull => safeIsEmpty || safeIsNull;

  /// Returns the length of the string, or `0` if the string is `null`.
  int get safeLength => safeString.length;

  /// Safely convert the number to int
  /// If the number is null, it returns 0
  int get safeToInt {
    return int.tryParse(toString()) ?? 0;
  }

  /// Safely convert the number to double
  /// /// If the number is null, it returns 0.0
  double get safeToDouble {
    return double.tryParse(toString()) ?? 0.0;
  }

  /// Counts the number of English characters in the string.
  /// Returns `0` if the string is empty or null.
  int get numberOfEnglishCharacters {
    if (isEmptyOrNull) return 0;
    return this!.allMatches(englishRegex.pattern).length;
  }

  /// Counts the number of Arabic characters in the string.
  /// Returns `0` if the string is empty or null.
  int get numberOfArabicCharacters {
    if (isEmptyOrNull) return 0;
    return this!.allMatches(arabicRegex.pattern).length;
  }

  /// Checks if the string contains English characters more than others.
  bool get isEnglishText {
    if (isEmptyOrNull) return false;

    return numberOfEnglishCharacters > numberOfArabicCharacters;
  }

  /// Checks if the string contains Arabic characters more than others.
  bool get isArabicText {
    if (isEmptyOrNull) return false;

    return numberOfArabicCharacters > numberOfEnglishCharacters;
  }

  /// Capitalizes the first letter of the given text.
  /// If the text is null, it returns an empty string.
  /// Example: "hello" becomes "Hello".
  String get safeCapitalize {
    if (isEmptyOrNull) return "";

    return this![0].toUpperCase() + this!.substring(1);
  }

  /// Removes all newlines from the given text.
  /// If the text is null, it returns an empty string.
  /// Example: "Hello\nWorld" becomes "Hello World".
  /// You can also specify a different default value to replace newlines.
  /// This is useful for cleaning up text input, such as comments or descriptions.
  String get safeRemoveLines {
    if (isEmptyOrNull) return "";

    return this!.replaceAll(RegExp(r'\n'), " ");
  }

  /// Converting hex color to [Color]
  /// Example: "#FF0000" returns [Colors.red]
  /// If the String is null or not right hex, [Colors.transparent] will be returned.
  Color get toColor {
    if (isEmptyOrNull) return Colors.transparent;

    final color = this!.replaceAll("#", "0xFF");

    if (color.safeToInt == -1) return Colors.transparent;

    return Color(int.parse(color));
  }
}
