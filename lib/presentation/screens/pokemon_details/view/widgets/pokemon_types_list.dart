part of 'pokemon_details_view.dart';

class _PokemonTypesList extends StatelessWidget {
  const _PokemonTypesList({required this.pokemonTypes});
  final List<PokemonTypeItem>? pokemonTypes;

  @override
  Widget build(BuildContext context) {
    if ((pokemonTypes?.length ?? 0) == 0) {
      return const SizedBox(
        height: 67,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children:
          pokemonTypes?.map((e) => e.type != null ? PokemonTypeWidget(e.type!) : const SizedBox.shrink()).toList() ??
              [],
    );
  }
}
