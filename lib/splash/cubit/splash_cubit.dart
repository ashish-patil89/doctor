import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial()) {}

  Future<void> init() async {
    try {
      emit(
        state.copyWith(
          splashStatus: SplashStatus.initial,
        ),
      );

      await Future.delayed(const Duration(milliseconds: 3000));

      emit(
        state.copyWith(
          splashStatus: SplashStatus.success,
        ),
      );
      return;
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      return null;
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
