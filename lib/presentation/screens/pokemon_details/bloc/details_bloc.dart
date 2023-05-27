import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/domain/model/pokemon/pokemon.dart';
import 'package:pokedex/domain/repository/pokemon_repository.dart';

part 'details_state.dart';
part 'details_event.dart';
part 'details_bloc.freezed.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(this._pokemonRepository) : super(const DetailsState.initial()) {
    on<_Fetch>(_onFetch);
  }
  final PokemonRepository _pokemonRepository;

  Future<void> _onFetch(_Fetch event, Emitter<DetailsState> emit) async {
    emit(const DetailsState.loadInProgress());
    try {
      final pokemon = await _pokemonRepository.search(event.id);
      emit(DetailsState.loadSuccess(pokemon));
    } catch (e) {
      emit(const DetailsState.loadFailure());
    }
  }
}
