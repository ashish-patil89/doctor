import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platform/platform.dart';
import 'package:user_repository/user_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required UserRepository userRepository,
    Platform localPlatform = const LocalPlatform(),
  })  : _userRepository = userRepository,
        _localPlatform = localPlatform,
        super(const LoginState.initial()) {}

  final UserRepository _userRepository;
  final Platform _localPlatform;

  Future<void> login() async {
    try {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.checking,
        ),
      );

      await Future.delayed(const Duration(milliseconds: 10000));

      emit(
        state.copyWith(
          loginStatus: LoginStatus.success,
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
