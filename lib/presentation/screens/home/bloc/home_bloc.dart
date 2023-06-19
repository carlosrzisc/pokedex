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
  }
  final PokemonRepository _pokemonRepository;
  int offset = 0;
  static const int _limit = 30;

  Future<void> _onLoad(_Load event, Emitter<HomeState> emit) async {
    if (state is LoadInProgress) {
      return;
    }
    emit(const HomeState.loadInProgress());
    try {
      final pokemonList = await _pokemonRepository.getPokemonList(offset: offset, limit: _limit);
      if (pokemonList == null) {
        emit(const HomeState.loadFailure());
        return;
      }
      offset += _limit;
      final hasReachedMax = pokemonList.length < _limit;
      emit(HomeState.loadSuccess(pokemonList, hasReachedMax: hasReachedMax));
    } catch (_) {
      emit(const HomeState.loadFailure());
    }
  }

  Future<void> _onSeach(_Search event, Emitter<HomeState> emit) async {
    if (state is LoadInProgress) {
      return;
    }
    emit(const HomeState.loadInProgress());
    try {
      final pokemon = await _pokemonRepository.search(event.pokemon.toLowerCase());
      emit(HomeState.pokemonFound(pokemon));
    } catch (e) {
      emit(const HomeState.pokemonNotFound());
    }
  }
}
