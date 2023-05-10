import 'package:pokedex/domain/model/pokemon/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>?> getPokemonList({required int offset, int limit});
  Future<Pokemon> getPokemonDetails(String id);
  Future<Pokemon> search(String pokemon);
}
