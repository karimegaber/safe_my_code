## 0.0.1

### Added
- **Initial release of the `safe_my_code` package.**
- **`CoreDataTypesSafetyMixin`**: A mixin for safe type conversions, including `safeString`, `safeInt`, `safeDouble`, `safeBool`, `safeList`, `safeSet`, `safeMap`, `safeBigInt`, and `safeDateTime`.
- **`NumericsExtension`**: An extension on `num?` for safe number checks and conversions, with getters like `isInt`, `isDouble`, `safeToInt`, `isEven`, and `numberOfDigits`.
- **`SafeStringExtension`**: An extension on `String?` for null-safe string operations, including `safeLength`, `safeCapitalize`, `toColor`, and checks for Arabic/English text.
- **`SafeListExtension`**: An extension on `List<T>?` to provide safe, null-aware methods such as `safeLength`, `safeIsEmpty`, `safeReversed`, and `safeFirstElement`.
- **`SafeMapExtension`**: An extension on `Map?` for handling maps safely, including `safeLength`, `safeKeys`, `safeValues`, and `safeSwapKeysAndValues`.
- **`UiSafetyMixin`**: A mixin for safe UI interactions, featuring methods like `safeContext`, `safeSetState`, `safeShowSnackBar`, `safeShowDialog`, and `safeUnfocus`.
- **`NavigationSafetyMixin`**: A mixin for safe navigation, with methods such as `safePushNamed`, `safePop`, `safeMaybePop`, and `safePopAndPushNamed`.
- **`ValidationsSafetyMixin`**: A mixin for common data validations, including `isValidEmail` and `isValidUrl`.
- **`LoggerSafetyMixin`**: A mixin that provides `safeLog(...)` to log messages only in debug mode.
- **`SafeStringHelper`**: A mixin for advanced string manipulation, including `safeRemoveWhiteSpaces`, `safeRemoveSpecialCharacters`, and `safeMaskText`.