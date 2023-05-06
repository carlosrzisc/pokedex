part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loadInProgress() = _LoadInProgress;
  const factory SplashState.authenticated() = _Authenticated;
  const factory SplashState.unAuthenticated() = _Unauthenticated;
}
