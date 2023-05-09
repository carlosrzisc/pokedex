part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loadInProgress() = LoadInProgress;
  const factory HomeState.loadSuccess(List<Pokemon> pokemons, {required bool hasReachedMax}) = _LoadSuccess;
  const factory HomeState.loadFailure() = _LoadFailure;
}
