import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const SplashState.initial()) {}

  final UserRepository _userRepository;

  Future<void> init() async {
    try {
      emit(
        state.copyWith(
          splashStatus: SplashStatus.initial,
        ),
      );

      isValidSession();

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

  Future<bool> isValidSession() async {
    try {
      final accessToken = await _userRepository.getAccessToken();

      emit(
        state.copyWith(
          isValidSession: accessToken != null,
        ),
      );
      return true;
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      return false;
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
