import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/presentation/screens/pokemon_details/view/widgets/pokemon_type_widget.dart';
import 'package:pokedex/presentation/utilities/extensions/text_extensions.dart';
import 'package:pokedex_api/pokedex_api.dart';

part 'pokemon_types_list.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView(this.pokemon, {super.key});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final image = pokemon.image;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _PokemonTypesList(pokemonTypes: pokemon.types),
          if (image != null)
            Hero(
              tag: 'image-${pokemon.pokemonId}',
              child: Image(image: CachedNetworkImageProvider(image)),
            )
          else
            const SizedBox.shrink(),
          Text(pokemon.name?.capitalize() ?? ''),
          Text('Height: ${pokemon.heightCm ?? ''} cm'),
          Text('Weight: ${pokemon.weightKg ?? ''} kg'),
        ],
      ),
    );
  }
}
