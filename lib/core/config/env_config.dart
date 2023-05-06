import 'package:flutter/foundation.dart';

abstract class EnvConfig {
  static const bool isApiLoggerEnabled = bool.fromEnvironment(
    'apiLoggerEnabled',
    defaultValue: kDebugMode,
  );
}
