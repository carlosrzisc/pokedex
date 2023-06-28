import 'package:pokedex_api/pokedex_api.dart';

abstract class PokemonRepository {
  Stream<List<Pokemon>> get pokemonList;
  Future<void> loadMore();
  Future<Pokemon> getPokemonDetails(String id);
  Future<Pokemon> search(String pokemon);
}
