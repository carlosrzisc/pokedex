import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';
import 'package:pokedex/presentation/screens/pokemon_details/view/widgets/pokemon_type_widget.dart';
import 'package:pokedex/presentation/utilities/extensions/text_extensions.dart';

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
          _PokemonTypesList(pokemon: pokemon),
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

class _PokemonTypesList extends StatelessWidget {
  const _PokemonTypesList({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    if ((pokemon.types?.length ?? 0) == 0) {
      return const SizedBox(
        height: 67,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:
          pokemon.types?.map((e) => e.type != null ? PokemonTypeWidget(e.type!) : const SizedBox.shrink()).toList() ??
              [],
    );
  }
}
