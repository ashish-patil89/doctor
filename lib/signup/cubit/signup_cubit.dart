import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platform/platform.dart';
import 'package:user_repository/user_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    required UserRepository userRepository,
    Platform localPlatform = const LocalPlatform(),
  })  : _userRepository = userRepository,
        _localPlatform = localPlatform,
        super(const SignupState()) {}

  final UserRepository _userRepository;
  final Platform _localPlatform;

  Future<void> signup() async {
    try {
      emit(
        state.copyWith(
          loginStatus: SignupStatus.checking,
        ),
      );

      final error = await _userRepository.signup(
        email: state.email!,
        password: state.password!,
        name: state.name!,
        role: 'doctor',
      );

      if (error.isNotEmpty) {
        emit(
          state.copyWith(
            loginStatus: SignupStatus.success,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          loginStatus: SignupStatus.failure,
        ),
      );
      return;
    } catch (error, stackTrace) {
      if (error is SignupFailedFailure) {
        emit(
          state.copyWith(
            signupInvalid: error.error as String,
          ),
        );
      }
      if (error is EmailFailedFailure) {
        emit(
          state.copyWith(
            emailInvalid: error.error as String,
          ),
        );
      }
      if (error is PasswordFailedFailure) {
        emit(
          state.copyWith(
            passwordInvalid: error.error as String,
          ),
        );
      }
      return null;
    }
  }

  void updateEmail(String inputEmail) {
    emit(state.copyWith(email: inputEmail));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateAgreeOnTerms(bool? agreed) {
    emit(state.copyWith(agreedOnTerms: agreed));
  }

  void resetErrors() {
    emit(
      state.copyWith(
        emailInvalid: '',
        passwordInvalid: '',
      ),
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
