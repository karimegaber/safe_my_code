import 'dart:developer';

import 'package:flutter/foundation.dart';

mixin LoggerSafetyMixin {
  void safeLog(String message, {String? source}) {
    if (kDebugMode) {
      log("${source != null ? "[$source] - " : ""}$message");
    }
  }
}
