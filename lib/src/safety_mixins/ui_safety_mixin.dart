import 'package:flutter/material.dart';

mixin UiSafetyMixin {
  /// Checks if a [BuildContext] is valid and mounted.
  ///
  /// Returns `true` if the context is not null and the widget is still mounted
  /// in the widget tree, otherwise returns `false`. This prevents errors when
  /// performing operations on a disposed widget.
  bool safeContext(BuildContext? context) {
    if (context == null) return false;

    return context.mounted;
  }

  /// Safely calls [setState] on a [State] object.
  ///
  /// This method ensures that [setState] is called only on a valid `State`
  /// instance, helping to avoid errors from calling `setState` on a disposed
  /// or unmounted state.
  void safeSetState(State state, VoidCallback callback) {
    // ignore: invalid_use_of_protected_member
    state.setState(callback);
  }

  /// Returns a safe, non-null [Widget] from a nullable widget.
  ///
  /// If the input [widget] is `null`, this method returns a `defaultWidget`,
  /// which is a `SizedBox.shrink()` by default. This helps prevent `null`
  /// errors in the widget tree.
  Widget safeWidget(
    Widget? widget, {
    Widget defaultWidget = const SizedBox.shrink(),
  }) {
    return widget ?? defaultWidget;
  }

  /// Safely scrolls to a widget identified by its [key] to make it visible.
  ///
  /// It ensures that the widget's context is valid before attempting the scroll
  /// animation, preventing errors if the widget is not currently mounted.
  Future<void> safeEnsureVisible(
    GlobalKey key, {
    int durationInMilliSeconds = 500,
    Curve curve = Curves.ease,
  }) async {
    final context = key.currentContext;

    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: durationInMilliSeconds),
      curve: curve,
    );
  }

  /// Safely retrieves [ThemeData] from a [context].
  ///
  /// Returns a `ThemeData.fallback()` if a theme is not found in the
  /// widget tree, preventing a runtime error.
  ThemeData safeTheme(BuildContext? context) {
    if (context == null || !context.mounted) {
      return ThemeData.fallback();
    }
    return Theme.of(context);
  }

  /// Safely retrieves [MediaQueryData] from a [context].
  ///
  /// Returns a default `MediaQueryData` if the context is not a descendant
  /// of a `MediaQuery` widget.
  MediaQueryData safeMediaQuery(BuildContext? context) {
    if (context == null || !context.mounted) {
      return MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.first,
      );
    }
    return MediaQuery.of(context);
  }

  /// Safely shows a [SnackBar] to the user.
  ///
  /// Ensures the [context] is valid and the [ScaffoldMessenger] is accessible
  /// before showing the snackbar.
  void safeShowSnackBar({
    required BuildContext? context,
    required SnackBar snackBar,
  }) {
    if (!safeContext(context)) return;

    ScaffoldMessenger.of(context!).showSnackBar(snackBar);
  }

  /// Safely shows a [Dialog] to the user.
  ///
  /// Ensures the [context] is valid before showing the dialog. Returns the
  /// value returned by the dialog.
  Future<void> safeShowDialog({
    required BuildContext? context,
    required Widget Function(BuildContext context) builder,
    bool barrierDismissible = true,
  }) async {
    if (!safeContext(context)) return;

    showDialog(
      context: context!,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  /// Safely removes the focus from the current widget, which hides the keyboard.
  ///
  /// Ensures the [context] is valid before attempting to unfocus.
  void safeUnfocus(BuildContext? context) {
    if (!safeContext(context)) return;

    FocusScope.of(context!).unfocus();
  }

  /// Safely retrieves the current device orientation.
  ///
  /// Returns [Orientation.portrait] if the context is invalid, otherwise returns
  /// the current orientation.
  Orientation safeOrientation(BuildContext? context) {
    final mediaQuery = safeMediaQuery(context);

    return mediaQuery.orientation;
  }
}
