import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';
import 'package:pokedex/presentation/screens/home/bloc/home_bloc.dart';
import 'package:pokedex/presentation/screens/home/view/widgets/pokemon_item.dart';

class PokemonListGridView extends StatefulWidget {
  const PokemonListGridView(this.pokemonList, {super.key});
  final List<Pokemon> pokemonList;

  @override
  State<PokemonListGridView> createState() => _PokemonListGridViewState();
}

class _PokemonListGridViewState extends State<PokemonListGridView> {
  final _scrollController = ScrollController();
  static const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10,
    childAspectRatio: 0.8,
  );

  @override
  void initState() {
    _scrollController.addListener(() => _onScroll(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.pokemonList.length,
      gridDelegate: gridDelegate,
      itemBuilder: (_, index) => PokemonItem(widget.pokemonList[index]),
      controller: _scrollController,
    );
  }

  void _onScroll(BuildContext context) {
    if (_isBottom) {
      context.read<HomeBloc>().add(const HomeEvent.load());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}