import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_api/src/model/pokemon/pokemon_type_item.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    String? name,
    String? url,
    int? id,
    List<PokemonTypeItem>? types,
    int? weight,
    int? height,
  }) = _Pokemon;
  const Pokemon._();
  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  String? get image {
    return '$imagesUrl$pokemonId.png';
  }

  int? get heightCm => height != null ? height! * 10 : null;
  int? get weightKg => weight != null ? (weight! / 10).floor() : null;

  String? get pokemonId => id?.toString() ?? url?.split('/').elementAt(6);
}

const imagesUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';
