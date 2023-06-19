import 'package:injectable/injectable.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/bootstrap.dart';

void main() async {
  await bootstrap(() => const App(), Environment.test);
}
