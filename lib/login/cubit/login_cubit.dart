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
        super(const LoginState()) {}

  final UserRepository _userRepository;
  final Platform _localPlatform;

  Future<bool> isValidSession() async {
    try {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.checking,
        ),
      );

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

  Future<void> login() async {
    try {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.checking,
        ),
      );

      final token = await _userRepository.login(
        email: state.email,
        password: state.password,
      );

      if (token != null) {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.success,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          loginStatus: LoginStatus.failure,
        ),
      );
      return;
    } catch (error, stackTrace) {
      addError(error, stackTrace);

      emit(
        state.copyWith(
          loginStatus: LoginStatus.failure,
        ),
      );

      return null;
    }
  }

  void updateEmail(String inputEmail) {
    emit(state.copyWith(email: inputEmail));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
