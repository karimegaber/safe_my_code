import 'package:safe_my_code/helpers/safe_string_helper.dart';
import 'package:safe_my_code/safety_mixins/core_data_types_safety_mixin.dart';
import 'package:safe_my_code/safety_mixins/logger_safety_mixin.dart';
import 'package:safe_my_code/safety_mixins/navigation_safety_mixin.dart';
import 'package:safe_my_code/safety_mixins/ui_safety_mixin.dart';

class _SafeMyCode
    with
        CoreDataTypesSafetyMixin,
        UiSafetyMixin,
        NavigationSafetyMixin,
        LoggerSafetyMixin,
        SafeStringHelper {
  _SafeMyCode._();
  static final _SafeMyCode _instance = _SafeMyCode._();
  static _SafeMyCode get instance => _instance;
}

/// This class is used to access all the possible helper methods for the package. <br>
/// Just to make it easier for you as a Developer in the development process. <br>
/// Because I love u all! :) - Instagram: `@karime.gaber`
// ignore: library_private_types_in_public_api
final _SafeMyCode SafeMyCode = _SafeMyCode.instance;
