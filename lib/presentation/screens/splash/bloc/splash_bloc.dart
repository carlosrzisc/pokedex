import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.dart';
part 'splash_event.dart';
part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initial()) {
    on<_Load>(_onLoad);
  }
  Future<void> _onLoad(_Load event, Emitter<SplashState> emit) async {
    emit(const SplashState.loadInProgress());
    // add logic to check if the user is already authenticated,
    // or any possible navigation from the splash screen, in this case we
    // will simply emit a state as authenticated
    await Future.delayed(const Duration(seconds: 3), () {
      emit(const SplashState.authenticated());
    });
  }
}
