import 'package:safe_my_code/src/extensions/safe_string_extension.dart';

mixin ValidationsSafetyMixin {
  /// Checks if the given text is a valid email address.
  bool isValidEmail(String? email) {
    if (email.isEmptyOrNull) return false;

    return RegExp(
      "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}\$",
    ).hasMatch(email!);
  }

  /// Checks if the given text is a valid URL.
  /// /// A valid URL starts with "http://" or "https://", followed by a domain name and optional path.
  /// Example: "https://www.example.com" is a valid URL.
  /// Example: "http://example.com/path/to/resource" is a valid URL.
  /// Example: "ftp://example.com/file.txt" is a valid URL.
  /// Example: "www.example.com" is not a valid URL.
  /// Example: "example.com" is not a valid URL.
  /// Example: "https://example" is not a valid URL.
  bool isValidUrl(String? email) {
    if (email.isEmptyOrNull) return false;

    return RegExp(
      r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(email!);
  }
}
