import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:pokedex/app/config/flavors/flavor_config.dart';

@dev
@Injectable(as: FlavorConfig)
class DevConfig implements FlavorConfig {
  @override
  String get name => Environment.dev;

  @override
  bool get enableLogging => kDebugMode;

  @override
  String get baseUrl => 'https://pokeapi.co/api/v2/';
}
