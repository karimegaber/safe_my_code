/// An extension on a nullable [List] to provide safe, null-aware methods.
///
/// This extension simplifies common list operations, ensuring that the code
/// doesn't throw null-related errors when dealing with a null list.
extension SafeListExtension<T> on List<T>? {
  /// Returns `true` if the list is `null`.
  bool get safeIsNull => this == null;

  /// Returns `true` if the list is either `null` or empty.
  bool get safeIsEmpty => this?.isEmpty ?? true;

  /// Returns `true` if the list is not `null` and not empty.
  bool get safeIsNotEmpty => this?.isNotEmpty ?? false;

  /// A convenient getter that returns `true` if the list is null or empty.
  bool get safeIsNullOrEmpty => safeIsNull || safeIsEmpty;

  /// Returns the length of the list, or `0` if the list is `null`.
  int get safeLength => this?.length ?? 0;

  /// Returns the current list, or a new empty list (`[]`) if the list is `null`.
  List<T> get safeEmptyIfNull => this ?? [];

  /// Returns a new list with the elements in reverse order.
  ///
  /// Returns an empty list if the original list is `null` or empty.
  List<T> get safeReversed {
    if (safeIsNullOrEmpty) {
      return [];
    }

    return this!.reversed.toList();
  }

  /// Returns the first element of the list, or `null` if the list is empty.
  T? get safeFirstElement {
    if (safeIsNullOrEmpty) {
      return null;
    }

    return this!.first;
  }

  /// Returns the last element of the list, or `null` if the list is empty.
  T? get safeLastElement {
    if (safeIsNullOrEmpty) {
      return null;
    }

    return this!.last;
  }
}
