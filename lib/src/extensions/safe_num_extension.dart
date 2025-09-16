extension NumericsExtension on num? {
  /// Check if the number is null
  bool get isNull => this == null;

  /// Check if the number is int
  bool get isInt => this is int;

  /// Check if the number is double
  bool get isDouble => this is double;

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

  /// Safely convert the number to string
  String get safeToString {
    return toString();
  }

  /// Returns the number with specific number of digits after decimal point
  /// If the number is null, it returns 0.0
  double afterDecimalPoint([int numbersAfterDecimalPoint = 2]) {
    if (isNull) return 0.0;

    return double.parse(this!.toStringAsFixed(numbersAfterDecimalPoint));
  }

  /// Checks if the number is even
  /// If the number is null, it returns false
  /// Example: 2 returns true
  /// Example: 3 returns false
  bool get isEven {
    if (isNull) return false;

    return this! % 2 == 0;
  }

  /// Checks if the number is odd
  /// If the number is null, it returns false
  /// Example: 3 returns true
  /// Example: 2 returns false
  bool get isOdd {
    if (isNull) return false;

    return !isEven;
  }

  /// Returns the number of digits in the number
  /// If the number is null, it returns 0
  /// Example: 123 returns 3
  /// Example: 123.7 returns 4
  int get numberOfDigits {
    if (isNull) return 0;

    if (isInt) return toString().length;

    if (isDouble) return toString().split(".").first.length;

    return 0;
  }

  /// Returns the number of digits after decimal point
  /// If the number is null, it returns 0
  /// Example: 123.7 returns 1
  /// Example: 123 returns 0
  int get numberOfDigitsAfterDecimalPoint {
    if (isNull || isInt) return 0;

    return toString().split(".").last.length;
  }

  /// Returns the number of digits before decimal point
  /// If the number is null, it returns 0
  /// Example: 123.7 returns 3
  /// Example: 123 returns 3
  int get numberOfDigitsBeforeDecimalPoint {
    if (isNull || isInt) return 0;

    return toString().split(".").first.length;
  }
}
