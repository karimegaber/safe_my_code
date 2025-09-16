import 'package:flutter/material.dart';
import 'package:safe_my_code/src/safety_mixins/ui_safety_mixin.dart';

mixin NavigationSafetyMixin on UiSafetyMixin {
  /// Returns the [NavigatorState] for the given [context].
  NavigatorState _navigator(BuildContext context) => Navigator.of(context);

  // ===============================================
  // Push Methods
  // ===============================================

  /// Pushes a new [screen] onto the navigation stack, ensuring the [context] is valid.
  ///
  /// Optionally accepts a [customRoute].
  Future<void> safePush({
    required BuildContext? context,
    required Widget screen,
    Route? customRoute,
  }) async {
    if (!safeContext(context)) return;

    await _navigator(
      context!,
    ).push(customRoute ?? MaterialPageRoute(builder: (_) => screen));
  }

  /// Pushes a new route onto the navigation stack by its [route] name.
  ///
  /// Ensures the [context] is valid and accepts optional [arguments].
  Future<void> safePushNamed({
    required BuildContext? context,
    required String route,
    Object? arguments,
  }) async {
    if (!safeContext(context)) return;

    await _navigator(context!).pushNamed(route, arguments: arguments);
  }

  /// Pushes a new [screen] and removes all previous routes from the stack.
  ///
  /// Ensures the [context] is valid and accepts an optional [customRoute].
  Future<void> safePushAndRemoveUntil({
    required BuildContext? context,
    required Widget screen,
    Route? customRoute,
  }) async {
    if (!safeContext(context)) return;

    await _navigator(context!).pushAndRemoveUntil(
      customRoute ?? MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  /// Pushes a new route by its [route] name and removes all previous routes.
  ///
  /// Ensures the [context] is valid and accepts optional [arguments].
  Future<void> safePushNamedAndRemoveUntil({
    required BuildContext? context,
    required String route,
    Object? arguments,
  }) async {
    if (!safeContext(context)) return;

    await _navigator(
      context!,
    ).pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
  }

  // ===============================================
  // Push Replacement Methods
  // ===============================================

  /// Replaces the current route with a new [screen] on the navigation stack.
  ///
  /// Ensures the [context] is valid and accepts an optional [customRoute].
  Future<void> safePushReplacement({
    required BuildContext? context,
    required Widget screen,
    Route? customRoute,
  }) async {
    if (!safeContext(context)) return;

    await _navigator(
      context!,
    ).pushReplacement(customRoute ?? MaterialPageRoute(builder: (_) => screen));
  }

  /// Replaces the current route with a new route specified by its [route] name.
  ///
  /// Ensures the [context] is valid and accepts optional [arguments].
  Future<void> safePushReplacementNamed({
    required BuildContext? context,
    required String route,
    Object? arguments,
  }) async {
    if (!safeContext(context)) return;

    await _navigator(
      context!,
    ).pushReplacementNamed(route, arguments: arguments);
  }

  // ===============================================
  // Pop Methods
  // ===============================================

  /// Pops the current route off the navigator.
  ///
  /// Ensures the [context] is valid and checks if a route can be popped before
  /// attempting the operation.
  void safePop(BuildContext? context) {
    if (!safeContext(context)) return;
    final navigator = _navigator(context!);
    if (!navigator.canPop()) return;

    navigator.pop();
  }

  /// Attempts to pop the current route off the navigator.
  ///
  /// Returns `true` if a route was popped, otherwise returns `false`. This is
  /// useful for gracefully handling back button presses.
  Future<bool> safeMaybePop(BuildContext? context) async {
    if (!safeContext(context)) return false;

    return await _navigator(context!).maybePop();
  }

  /// Pops routes from the stack until the specified [routeName] is reached.
  ///
  /// Ensures the [context] is valid.
  void safePopUntilNamed({
    required BuildContext? context,
    required String routeName,
  }) {
    if (!safeContext(context)) return;

    _navigator(context!).popUntil((route) => route.settings.name == routeName);
  }

  // ===============================================
  // General Methods
  // ===============================================

  /// Pops the current route and pushes a new one by its [route] name.
  ///
  /// Ensures the [context] is valid and accepts optional [arguments].
  Future<void> safePopAndPushNamed({
    required BuildContext? context,
    required String route,
    Object? arguments,
  }) async {
    if (!safeContext(context)) return;

    await Navigator.of(context!).popAndPushNamed(route, arguments: arguments);
  }
}
