import 'package:injectable/injectable.dart';

import 'package:pokedex/core/config/flavors/flavor_config.dart';

@prod
@Injectable(as: FlavorConfig)
class ProdConfig implements FlavorConfig {
  @override
  String get name => Environment.prod;

  @override
  bool get enableLogging => false;

  @override
  String get baseUrl => 'https:&#x2F;&#x2F;pokeapi.co&#x2F;api&#x2F;v2&#x2F;';
}
