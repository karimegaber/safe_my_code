import 'dart:convert' show jsonDecode;

mixin CoreDataTypesSafetyMixin {
  /// Safely converts a value to a [String].
  ///
  /// Returns the `value`'s string representation. If `value` is `null`, it
  /// returns the `defaultValue`, which is `""` by default.
  String safeString(dynamic value, {String defaultValue = ""}) {
    if (value == null) {
      return defaultValue;
    }

    return value.toString();
  }

  /// Safely converts a value to an [int].
  ///
  /// This method handles conversion from `null`, `int`, `double`, and `String`
  /// types. It returns `0` if the value cannot be converted, or a custom
  /// `defaultValue` if provided.
  int safeInt(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;

    if (value is int) {
      return value;
    }

    if (value is double) {
      return value.toInt();
    }

    if (value is String) {
      return int.tryParse(value) ?? defaultValue;
    }

    return defaultValue;
  }

  /// Safely converts a value to a [double].
  ///
  /// This method handles conversion from `null`, `int`, and `String` types.
  /// It returns `0.0` if the value cannot be converted, or a custom
  /// `defaultValue` if provided.
  double safeDouble(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;

    if (value is int) {
      return value.toDouble();
    }

    if (value is String) {
      return double.tryParse(value) ?? defaultValue;
    }

    return defaultValue;
  }

  /// Safely converts a value to a [num].
  ///
  /// This method handles conversion from `null`, `int`, `double`, and `String`
  /// types. It returns `0` if the value cannot be converted, or a custom
  /// `defaultValue` if provided.
  num safeNum(dynamic value, {num defaultValue = 0}) {
    if (value == null) return defaultValue;

    if (value is int) {
      return value;
    }

    if (value is double) {
      return value;
    }

    if (value is String) {
      return num.tryParse(value) ?? defaultValue;
    }

    return defaultValue;
  }

  /// Safely converts a value to a [bool].
  ///
  /// Handles conversion from `null`, `int` (`0` or `1`), and `String` (`"0"` or `"1"`).
  /// Returns `false` for `null` or unhandled types, or a custom `defaultValue`
  /// if provided.
  bool safeBool(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;

    if (value is int) {
      if (value == 0) return false;
      if (value == 1) return true;
      return defaultValue;
    }

    if (value is String) {
      if (value == "0") return false;
      if (value == "1") return true;
      return defaultValue;
    }

    return value ?? defaultValue;
  }

  /// Safely converts a value to a [List].
  ///
  /// Handles `null` values by returning an empty list. It also attempts to
  /// `jsonDecode` a `String` value into a list.
  List safeList(dynamic value) {
    if (value == null) {
      return [];
    }

    if (value is String) {
      try {
        final decodedValue = jsonDecode(value);
        if (decodedValue is List) {
          return decodedValue;
        }
      } catch (e) {
        // Handle decoding errors by returning an empty list.
      }
      return [];
    }

    return value;
  }

  /// Safely converts a value to a [Set].
  ///
  /// Handles `null` values by returning an empty set. It also attempts to
  /// `jsonDecode` a `String` value into a set.
  Set safeSet(dynamic value) {
    if (value == null) {
      return {};
    }

    if (value is String) {
      try {
        final decodedValue = jsonDecode(value);
        if (decodedValue is Set) {
          return decodedValue;
        }
      } catch (e) {
        // Handle decoding errors by returning an empty set.
      }
      return {};
    }

    return value;
  }

  /// Safely converts a value to a [Map].
  ///
  /// Handles `null` values by returning an empty map. It also attempts to
  /// `jsonDecode` a `String` value into a map.
  Map safeMap(dynamic value) {
    if (value == null) {
      return {};
    }

    if (value is String) {
      try {
        final decodedValue = jsonDecode(value);
        if (decodedValue is Map) {
          return decodedValue;
        }
      } catch (e) {
        // Handle decoding errors by returning an empty map.
      }
      return {};
    }

    return value;
  }

  /// Safely converts a value to a [BigInt].
  ///
  /// This method handles conversions from `null`, `int`, `double`, and `String`.
  /// It returns `BigInt.zero` if the value is `null` or cannot be converted.
  BigInt safeBigInt(dynamic value) {
    if (value == null) {
      return BigInt.zero;
    }

    if (value is BigInt) {
      return value;
    }

    if (value is int) {
      return BigInt.from(value);
    }

    if (value is double) {
      return BigInt.from(value.toInt());
    }

    if (value is String) {
      return BigInt.tryParse(value) ?? BigInt.zero;
    }

    return BigInt.zero;
  }

  /// Safely converts a value to a [DateTime].
  ///
  /// This method handles conversions from `null`, `int`, `double`, and `String`.
  /// It returns `DateTime.now()` if the value is `null` or cannot be converted.
  DateTime safeDateTime(dynamic value) {
    final now = DateTime.now();

    if (value == null) {
      return now;
    }

    if (value is DateTime) {
      return value;
    }

    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    }

    if (value is double) {
      return DateTime.fromMillisecondsSinceEpoch(value.toInt());
    }

    if (value is String) {
      return now;
    }

    return now;
  }
}
