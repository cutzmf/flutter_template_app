import 'package:flutter/foundation.dart';

class Config {
  static const baseUrl = 'https://$server/api/v1';

  static const server = String.fromEnvironment(
    'SERVER',
    defaultValue: 'dev.server.io',
  );

  static const bool hasDevOptions = bool.fromEnvironment(
    'FEATURE_TOGGLE_DEV_OPTIONS',
    defaultValue: !kReleaseMode,
  );
}
