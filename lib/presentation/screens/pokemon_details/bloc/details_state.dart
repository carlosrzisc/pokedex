part of 'details_bloc.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState.initial() = DetailsInitial;
  const factory DetailsState.loadInProgress() = _LoadInProgress;
  const factory DetailsState.loadSuccess(Pokemon pokemon) = DetailsSuccess;
  const factory DetailsState.loadFailure() = _LoadFailure;
}
