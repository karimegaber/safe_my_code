extension SafeMapExtension on Map? {
  /// Checks if the map is empty.
  bool get safeIsEmpty {
    return this?.isEmpty ?? true;
  }

  /// Checks if the map is null or empty.
  bool get isEmptyOrNull {
    return this == null || safeIsEmpty;
  }

  /// Checks if the map is not null and not empty.
  bool get safeIsNotEmpty {
    return this?.isNotEmpty ?? false;
  }

  /// Check if two maps are identical <br>
  /// If both are null -> true <br>
  /// If both are empty -> true <br>
  /// Both keys and values must be identical at the same index
  bool safeIdenticalTo(Map? other) {
    // Both are null
    if (this == null && other == null) return true;

    // Both are empty
    if (safeIsEmpty && other.safeIsEmpty) return true;

    if (this != null && other != null) {
      if (safeLength == other.safeLength) {
        for (int i = 0; i < safeLength; i++) {
          final currentMapKey = safeKeys.elementAt(i);
          final currentMapValue = safeValues.elementAt(i);

          final otherMapKey = other.keys.elementAt(i);
          final otherMapValue = other.values.elementAt(i);

          // Validate keys the runtime type
          if (currentMapKey.runtimeType != otherMapKey.runtimeType) {
            return false;
          }

          // Validate keys values
          if (currentMapKey != otherMapKey) {
            return false;
          }

          // Validate values the runtime type
          if (currentMapValue.runtimeType != otherMapValue.runtimeType) {
            return false;
          }

          // Validate values values
          if (currentMapValue != otherMapValue) {
            return false;
          }
        }

        return true;
      } else {
        return false;
      }
    }

    return false;
  }

  /// Returns the length of the map
  int get safeLength => this?.length ?? 0;

  /// Returns the values of the map as a list
  List get safeValues => this?.values.toList() ?? [];

  /// Returns the keys of the map as a list
  List get safeKeys => this?.keys.toList() ?? [];

  /// Swaps the keys and values in the map
  Map get safeSwapKeysAndValues {
    if (isEmptyOrNull) return {};

    final Map result = {};

    for (int i = 0; i < this!.length; i++) {
      result.addEntries([
        MapEntry(this!.values.elementAt(i), this!.keys.elementAt(i)),
      ]);
    }

    return result;
  }

  // /// Combines the map with another map
  // /// Returns a new map with the values of both maps
  // /// Example: {1: "a", 2: "b"} + {3: "c", 4: "d"} returns {1: "a", 2: "b", 3: "c", 4: "d"}
  // Map combineWith(Map other) {
  //   this!.addAll(other);
  //   return {...this!, ...other};
  // }

  // /// Removes all null values from the map
  // Map get removeNullValues {
  //   if (isEmptyOrNull) return {};

  //   final result = this;

  //   result!.removeWhere((k, v) => v == null);

  //   return result;
  // }
}
