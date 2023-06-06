import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/domain/model/pokemon/pokemon_type.dart';

part 'pokemon_type_item.freezed.dart';
part 'pokemon_type_item.g.dart';

@freezed
class PokemonTypeItem with _$PokemonTypeItem {
  factory PokemonTypeItem({PokemonType? type}) = _PokemonTypeItem;

  factory PokemonTypeItem.fromJson(Map<String, dynamic> json) => _$PokemonTypeItemFromJson(json);
}
