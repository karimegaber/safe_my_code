# Safe My Code

`safe_my_code` is a lightweight Flutter package that helps you write safer, cleaner code with less boilerplate. It offers a collection of helpful extensions and mixins to prevent common errors and speed up development. The package is continuously updated with new features and improvements.

## Getting Started
Add this package to your Dart or Flutter project by adding this line to your `pubspec.yaml`:

```yaml
dependencies:
  safe_my_code: ^0.0.1
```

# Features
### Core Data Types & Extensions
- `SafeMyCode.safeString(...)`: Converts a dynamic value to a non-null string.
- `SafeMyCode.safeInt(...)`: Converts a dynamic value to a non-null integer.
- `SafeMyCode.safeDouble(...)`: Converts a dynamic value to a non-null double.
- `SafeMyCode.safeNum(...)`: Converts a dynamic value to a non-null number.
- `SafeMyCode.safeBool(...)`: Converts a dynamic value to a non-null boolean.
- `SafeMyCode.safeList(...)`: Safely converts a dynamic value to a non-null `List`.
- `SafeMyCode.safeSet(...)`: Safely converts a dynamic value to a non-null `Set`.
- `SafeMyCode.safeMap(...)`: Safely converts a dynamic value to a non-null `Map`.
- `SafeMyCode.safeBigInt(...)`: Safely converts a dynamic value to a non-null `BigInt`.
- `SafeMyCode.safeDateTime(...)`: Safely converts a dynamic value to a non-null `DateTime`.

```dart
    // Safely parse an integer from a dynamic value, providing a default if parsing fails.
    int userId = SafeMyCode.safeInt("123"); // 123
    int invalidId = SafeMyCode.safeInt("abc", defaultValue: -1); // -1
    print(userId);

    // Safely convert a dynamic value to a string.
    String value = SafeMyCode.safeString(100); // "100"
    String nullValue = SafeMyCode.safeString(null); // ""
    print(value);

    // Safely decode a JSON string into a list.
    List products = SafeMyCode.safeList('[{"name": "Apple"}, {"name": "Orange"}]');
    List empty = SafeMyCode.safeList(null); // []
    print(products);
```

### Number Extension (`num?`)
- `isNull`: Checks if the number is null.
- `isInt`: Checks if the number is an integer.
- `isDouble`: Checks if the number is a double.
- `safeToInt`: Safely converts the number to an integer, returning `0` if null.
- `safeToDouble`: Safely converts the number to a double, returning `0.0` if null.
- `safeToString`: Safely converts the number to a string.
- `afterDecimalPoint(...)`: Returns the number with a specific number of decimal digits.
- `isEven`: Checks if the number is even, returning `false` if null.
- `isOdd`: Checks if the number is odd, returning `false` if null.
- `numberOfDigits`: Returns the number of digits in the number, returning `0` if null.
- `numberOfDigitsAfterDecimalPoint`: Returns the number of digits after the decimal point.
- `numberOfDigitsBeforeDecimalPoint`: Returns the number of digits before the decimal point.

```dart
    // Safely convert a nullable num to an integer.
    num? price = 99.99;
    int intPrice = price.safeToInt; // 99
    print(intPrice);

    // Format a double to a specific number of decimal places.
    num? value = 3.14159;
    double formattedValue = value.afterDecimalPoint(2); // 3.14
    print(formattedValue);

    // Check if a number is even or odd without worrying about nulls.
    int? count = 10;
    print(count.isEven); // true
```

### String Extension (`String?`)
- `safeString`: Returns a safe, non-null string representation.
- `safeIsNull`: Checks if the string is null.
- `safeIsNotNull`: Checks if the string is not null.
- `safeIsEmpty`: Checks if the string is either null or empty.
- `safeIsNotEmpty`: Checks if the string is not null and not empty.
- `isEmptyOrNull`: Checks if the string is empty or null.
- `safeLength`: Returns the length of the string, or `0` if null.
- `safeToInt`: Safely converts the string to an integer.
- `safeToDouble`: Safely converts the string to a double.
- `numberOfEnglishCharacters`: Counts English characters.
- `numberOfArabicCharacters`: Counts Arabic characters.
- `isEnglishText`: Checks if the string contains more English characters than Arabic.
- `isArabicText`: Checks if the string contains more Arabic characters than English.
- `safeCapitalize`: Capitalizes the first letter.
- `safeRemoveLines`: Removes all newlines from the string.
- `toColor`: Converts a hex color string to a `Color`.

```dart
    // Check if a string is null or empty.
    String? username = "";
    if (username.isEmptyOrNull) {
    print("Username is required.");
    }

    // Capitalize the first letter of a string.
    String name = "john";
    print(name.safeCapitalize); // "John"

    // Convert a hex color string directly to a Flutter Color object.
    String hex = "#4CAF50";
    Color successColor = hex.toColor; // Color(0xFF4CAF50)
    print(successColor);
```

### List Extension (`List<T>?`)
- `safeIsNull`: Checks if the list is null.
- `safeIsEmpty`: Checks if the list is either null or empty.
- `safeIsNotEmpty`: Checks if the list is not null and not empty.
- `safeIsNullOrEmpty`: Checks if the list is null or empty.
- `safeLength`: Returns the length of the list, or `0` if null.
- `safeEmptyIfNull`: Returns the list or a new empty list if null.
- `safeReversed`: Returns a new reversed list.
- `safeFirstElement`: Returns the first element of the list, or `null` if empty.
- `safeLastElement`: Returns the last element of the list, or `null` if empty.

```dart
    // Get the length of a list that might be null.
    List? items;
    print(items.safeLength); // 0

    // Get the first element of a list without throwing a state error if it's empty or null.
    List<String>? names = [];
    String? firstName = names.safeFirstElement; // null
    print(firstName);

    // Ensure a list is never null, useful for loops.
    List<int>? scores;
    for (var score in scores.safeEmptyIfNull) {
    // This loop runs 0 times instead of crashing.
    print(score);
    }
```

### Map Extension (`Map?`)
- `safeIsEmpty`: Checks if the map is empty.
- `isEmptyOrNull`: Checks if the map is null or empty.
- `safeIsNotEmpty`: Checks if the map is not null and not empty.
- `safeIdenticalTo(...)`: Checks if two maps are identical.
- `safeLength`: Returns the length of the map, or `0` if null.
- `safeValues`: Returns the values as a list.
- `safeKeys`: Returns the keys as a list.
- `safeSwapKeysAndValues`: Swaps the keys and values.

```dart
    // Check if a map is null or empty with a single getter.
    Map? userSettings;
    if (userSettings.isEmptyOrNull) {
    print("No settings found.");
    }

    // Get the length of a map safely.
    Map? data;
    int count = data.safeLength; // 0
    print(count);

    // Swap keys and values in a map.
    final originalMap = {'name': 'John', 'role': 'Admin'};
    final swappedMap = originalMap.safeSwapKeysAndValues; // {'John': 'name', 'Admin': 'role'}
    print(swappedMap);
```

### UI Safety Mixin
- `SafeMyCode.safeContext(...)`: Checks if a `BuildContext` is valid and mounted.
- `SafeMyCode.safeSetState(...)`: Safely calls `setState`.
- `SafeMyCode.safeWidget(...)`: Returns a safe, non-null widget.
- `SafeMyCode.safeEnsureVisible(...)`: Safely scrolls to a widget.
- `SafeMyCode.safeTheme(...)`: Safely retrieves `ThemeData`.
- `SafeMyCode.safeMediaQuery(...)`: Safely retrieves `MediaQueryData`.
- `SafeMyCode.safeShowSnackBar(...)`: Safely shows a `SnackBar`.
- `SafeMyCode.safeShowDialog(...)`: Safely shows a `Dialog`.
- `SafeMyCode.safeUnfocus(...)`: Safely unfocuses to hide the keyboard.
- `SafeMyCode.safeOrientation(...)`: Safely retrieves the device orientation.

```dart
    // Show a SnackBar without crashing if the widget has been disposed.
    SafeMyCode.safeShowSnackBar(
    context: context,
    snackBar: const SnackBar(content: Text("Profile updated!")),
    );

    // Display a dialog safely.
    SafeMyCode.safeShowDialog(
    context: context,
    builder: (ctx) => const AlertDialog(title: Text("Confirmation")),
    );

    // Hide the keyboard by removing focus from the current input field.
    SafeMyCode.safeUnfocus(context);
```

### Navigation Safety Mixin
- `SafeMyCode.safePush(...)`: Pushes a new screen onto the stack.
- `SafeMyCode.safePushNamed(...)`: Pushes a new route by name.
- `SafeMyCode.safePushAndRemoveUntil(...)`: Pushes a new screen and removes all previous routes.
- `SafeMyCode.safePushNamedAndRemoveUntil(...)`: Pushes a new route by name and removes all previous routes.
- `SafeMyCode.safePushReplacement(...)`: Replaces the current route with a new screen.
- `SafeMyCode.safePushReplacementNamed(...)`: Replaces the current route with a new route by name.
- `SafeMyCode.safePop(BuildContext? context)`: Pops the current route.
- `SafeMyCode.safeMaybePop(BuildContext? context)`: Attempts to pop the current route.
- `SafeMyCode.safePopUntilNamed(...)`: Pops routes until the specified named route is reached.
- `SafeMyCode.safePopAndPushNamed(...)`: Pops the current route and pushes a new one.

```dart
    // Safely push a new screen, avoiding errors if the context is no longer valid.
    SafeMyCode.safePush(context: context, screen: const DetailsScreen());

    // Push a named route and clear the entire navigation stack, perfect for post-login navigation.
    SafeMyCode.safePushNamedAndRemoveUntil(context: context, route: '/home');

    // Safely pop the current route, but only if it's possible.
    SafeMyCode.safePop(context);
```

### Validations Safety Mixin
- `SafeMyCode.isValidEmail(...)`: Checks if a string is a valid email.
- `SafeMyCode.isValidUrl(...)`: Checks if a string is a valid URL.

```dart
    // Validate user input for an email field.
    final bool isEmailValid = SafeMyCode.isValidEmail("test@example.com"); // true
    final bool isEmailInvalid = SafeMyCode.isValidEmail("test@.com"); // false
    print(isEmailValid);

    // Validate a URL.
    final bool isUrlValid = SafeMyCode.isValidUrl("https://google.com"); // true
    final bool isUrlInvalid = SafeMyCode.isValidUrl("www.google.com"); // false
    print(isUrlValid);
```

### Logger Safety Mixin
- `SafeMyCode.safeLog(String message, ...)`: Logs a message only in debug mode.

```dart
    // Log a simple message that only appears in debug mode.
    SafeMyCode.safeLog("User tapped the login button.");

    // Log a message with a source tag for easier filtering.
    SafeMyCode.safeLog("API call failed.", source: "ApiService");
```

### String Helper Mixin
- `SafeMyCode.safeRemoveWhiteSpaces(...)`: Removes all spaces.
- `SafeMyCode.safeRemoveSpecialCharacters(...)`: Removes all special characters.
- `SafeMyCode.safeMarkdownToPlainText(...)`: Converts Markdown text to plain text.
- `SafeMyCode.enToArNumbers(...)`: Converts English numbers to Arabic.
- `SafeMyCode.arToEnNumbers(...)`: Converts Arabic numbers to English.
- `SafeMyCode.safeMaskText(...)`: Masks a string with a specified character.

```dart
    // Sanitize user input by removing special characters.
    final cleanUsername = SafeMyCode.safeRemoveSpecialCharacters("user@name#123"); // "username123"
    print(cleanUsername);

    // Convert numbers within a string to Arabic numerals.
    final arabicTime = SafeMyCode.enToArNumbers("Order 123 was placed at 10:30 PM"); // "Order ١٢٣ was placed at ١٠:٣٠ PM"
    print(arabicTime);

    // Mask a phone number, showing only the first digit.
    final maskedPhone = SafeMyCode.safeMaskText(text: "5551234567"); // "5*********"
    print(maskedPhone);
```


## Follow Me On
[![Follow on Instagram](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://instagram.com/karime.gaber)

[![Email me](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:dev.karime.gaber@gmail.com)

[![Connect on LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/karimessamgaber/)
