import 'package:injectable/injectable.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/bootstrap.dart';
import 'package:pokedex/core/config/config.dart';

void main() async {
  await config(Environment.dev);
  await bootstrap(() => const App());
}
