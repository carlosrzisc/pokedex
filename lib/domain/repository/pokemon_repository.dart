import 'package:pokedex/domain/model/pokemon/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>?> getPokemonList();
  Future<Pokemon> getPokemonDetails(String id);
}
