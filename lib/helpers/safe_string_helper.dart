import 'package:safe_my_code/extensions/safe_string_extension.dart';

mixin SafeStringHelper {
  // Arabic and English Numbers Strings
  static final Map<String, String> _numbers = {
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

  /// Removes all spaces from the given text.<br>
  /// If the text is null, it returns an empty string.<br>
  /// Example: "Hello World" becomes "HelloWorld".<br>
  String safeRemoveWhiteSpaces(String? text) {
    if (text.isEmptyOrNull) return "";

    return text!.replaceAll(" ", "");
  }

  /// Removes all special characters from the given text. <br>
  /// If the text is null, it returns an empty string. <br>
  /// Example: "Hello@World!" becomes "HelloWorld". <br>
  /// This method uses a regular expression to match all non-word characters and replaces them with an empty string. <br>
  /// Non-word characters include anything that is not a letter, digit, or underscore. <br>
  /// This is useful for cleaning up text input, such as usernames or file names. <br>
  String safeRemoveSpecialCharacters(String? text) {
    if (text.isEmptyOrNull) return "";

    return text!.replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  /// Converts the given text to plain text by removing Markdown formatting. <br>
  /// If the text is null, it returns an empty string. <br>
  /// Example: "**Hello**" becomes "Hello". <br>
  String safeMarkdownToPlainText(String? text) {
    if (text.isEmptyOrNull) return "";

    final codeBlockRegex = RegExp(r'```[\s\S]*?```', multiLine: true);
    final inlineCodeRegex = RegExp(r'`([^`]*)`');
    final imageRegex = RegExp(
      r'!$begin:math:display$([^$end:math:display$]*)\]$begin:math:text$[^)]+$end:math:text$',
    );
    final linkRegex = RegExp(
      r'$begin:math:display$([^$end:math:display$]+)\]$begin:math:text$[^)]+$end:math:text$',
    );
    final boldItalicRegex = RegExp(r'(\*\*|__|\*|_)');
    final strikethroughRegex = RegExp(r'~~');
    final headerRegex = RegExp(r'^#{1,6}\s*', multiLine: true);
    final blockquoteRegex = RegExp(r'^>\s?', multiLine: true);
    final listRegex = RegExp(r'^(\s*[-*+]\s+|\s*\d+\.\s+)', multiLine: true);
    final hrRegex = RegExp(r'^([-*_]){3,}$', multiLine: true);

    return text!
        .replaceAll(codeBlockRegex, '') // remove code blocks
        .replaceAll(inlineCodeRegex, r'$1') // keep inline code content
        .replaceAll(imageRegex, r'$1') // keep alt text
        .replaceAll(linkRegex, r'$1') // keep link text
        .replaceAll(boldItalicRegex, '') // remove bold/italic markers
        .replaceAll(strikethroughRegex, '') // remove strikethrough
        .replaceAll(headerRegex, '') // remove headers
        .replaceAll(blockquoteRegex, '') // remove blockquotes
        .replaceAll(listRegex, '') // remove list markers
        .replaceAll(hrRegex, '') // remove horizontal rules
        .replaceAll(RegExp(r'\n{2,}'), '\n'); // collapse multiple newlines
  }

  /// Converts the numbers in the given text to Arabic numbers.
  String enToArNumbers(String? text) {
    if (text.isEmptyOrNull) return "";

    return text!.replaceAllMapped(
      RegExp(r'[0-9]'),
      (match) => _numbers[match.group(0)] ?? match.group(0)!,
    );
  }

  /// Converts the numbers in the given text to English numbers.
  String arToEnNumbers(String? text) {
    if (text.isEmptyOrNull) return "";

    return text!.replaceAllMapped(
      RegExp(r'[\u0660-\u0669]'),
      (match) => _numbers.entries
          .firstWhere(
            (entry) => entry.value == match.group(0),
            orElse: () => MapEntry(match.group(0)!, match.group(0)!),
          )
          .key,
    );
  }

  /// Masking the text and replacing some letters with "*" by default.
  /// Example: "Hello World" returns "H**** ****".
  /// You can also specify a different default value to replace letters.
  /// Example: "Hello World".maskText(mask: "x") returns "Hxxxx xxxx".
  /// If the String is null, an empty text will be returned.
  String safeMaskText({
    required String? text,
    bool showFirstLetter = true,
    String mask = "*",
  }) {
    if (text.isEmptyOrNull) return "";

    return text!.split("").map((character) {
      if (text.indexOf(character) == 0 && showFirstLetter) return character;

      return mask;
    }).join("");
  }
}
