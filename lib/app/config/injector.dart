import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:pokedex/app/config/injector.config.dart';

@InjectableInit(preferRelativeImports: false)
Future<void> configure(String environment) async {
  await GetIt.instance.init(environment: environment);
}
