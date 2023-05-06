import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:pokedex/core/injection/injector.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configure(String environment) async {
  await getIt.init(environment: environment);
}
