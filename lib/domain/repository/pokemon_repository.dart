import 'package:pokedex_api/pokedex_api.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>?> getPokemonList({required int offset, int limit});
  Future<Pokemon> getPokemonDetails(String id);
  Future<Pokemon> search(String pokemon);
}
