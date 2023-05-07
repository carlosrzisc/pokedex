import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/screens/home/bloc/home_bloc.dart';
import 'package:pokedex/presentation/screens/home/view/widgets/pokemon_item.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<HomeBloc>()..add(const HomeEvent.load()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loadInProgress: () => const CircularProgressIndicator(),
            loadSuccess: (pokemonList) => GridView.builder(
              itemCount: pokemonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) => PokemonItem(
                pokemonList[index],
                onTap: () {},
              ),
            ),
            loadFailure: () => const Text('Something went wrong'),
          );
        },
      ),
    );
  }
}
