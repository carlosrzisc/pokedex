import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/core/theme/theme.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';
import 'package:pokedex/presentation/screens/home/view/widgets/badge.dart';
import 'package:pokedex/presentation/utilities/extensions/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem(
    this._pokemon, {
    this.onTap,
    super.key,
  });
  final Pokemon _pokemon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = _pokemon.image;
    return ListTile(
      title: Stack(
        children: [
          if (image != null)
            Hero(tag: 'image-${_pokemon.pokemonId}', child: Image(image: CachedNetworkImageProvider(image)))
          else
            const SizedBox(
              height: 20,
            ),
          Positioned(
            top: 0,
            right: 0,
            child: ItemBadge(_pokemon.pokemonId.toString()),
          ),
        ],
      ),
      subtitle: Text(
        _pokemon.name?.capitalize() ?? '',
        textAlign: TextAlign.center,
        style: GoogleFonts.bungee().copyWith(color: AppColors.white, fontSize: 12),
      ),
      onTap: onTap,
    );
  }
}
