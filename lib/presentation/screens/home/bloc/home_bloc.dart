import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._pokemonRepository) : super(const HomeState.initial()) {
    on<_Load>(_onLoad);
  }
  final PokemonRepository _pokemonRepository;

  Future<void> _onLoad(_Load event, Emitter<HomeState> emit) async {
    emit(const HomeState.loadInProgress());
    try {
      final pokemonList = await _pokemonRepository.getPokemonList();
      if (pokemonList == null) {
        emit(const HomeState.loadFailure());
        return;
      }
      emit(HomeState.loadSuccess(pokemonList));
    } catch (_) {
      emit(const HomeState.loadFailure());
    }
  }
}
