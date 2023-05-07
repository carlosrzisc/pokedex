import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    String? name,
    String? url,
  }) = _Pokemon;
  const Pokemon._();
  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  String? get image {
    return '$imagesUrl$id.png';
  }

  String? get id => url?.split('/').elementAt(6);
}

const imagesUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';
