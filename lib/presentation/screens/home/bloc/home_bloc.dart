import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_api/pokedex_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._pokemonRepository) : super(const HomeState.initial()) {
    on<_Load>(_onLoad);
    on<_Search>(_onSeach);
    on<_SubscriptionRequested>(_onSubscriptionRequested);
  }
  final PokemonRepository _pokemonRepository;

  Future<void> _onSubscriptionRequested(_SubscriptionRequested event, Emitter<HomeState> emit) async {
    await emit.forEach<List<Pokemon>>(
      _pokemonRepository.pokemonList,
      onData: HomeState.loadSuccess,
      onError: (error, stackTrace) => const HomeState.loadFailure(),
    );
  }

  void _onLoad(_Load event, Emitter<HomeState> emit) {
    if (state is LoadInProgress) return;

    emit(const HomeState.loadInProgress());
    _pokemonRepository.loadMore();
  }

  Future<void> _onSeach(_Search event, Emitter<HomeState> emit) async {
    if (state is LoadInProgress) return;

    emit(const HomeState.loadInProgress());
    try {
      final pokemon = await _pokemonRepository.search(event.pokemon.toLowerCase());
      emit(HomeState.pokemonFound(pokemon));
    } catch (_) {
      emit(const HomeState.pokemonNotFound());
    }
  }
}
