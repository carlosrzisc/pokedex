import 'package:flutter/material.dart';
import 'package:pokedex/l10n/l10n.dart';

class PokemonInputSearch extends StatefulWidget {
  const PokemonInputSearch({
    this.onSearch,
    super.key,
  });
  final void Function(String)? onSearch;

  @override
  State<PokemonInputSearch> createState() => _PokemonInputSearchState();
}

class _PokemonInputSearchState extends State<PokemonInputSearch> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: context.l10n.searchPokemon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => widget.onSearch?.call(_controller.text),
          ),
          fillColor: Theme.of(context).textTheme.bodyMedium?.color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
