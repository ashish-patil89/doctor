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

      final success = await _userRepository.signup(
        email: state.email!,
        password: state.password!,
        name: state.name!,
        dob: state.dob!,
        phone: state.phone!,
        role: 'user',
      );

      if (success) {
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
      addError(error, stackTrace);

      emit(
        state.copyWith(
          loginStatus: SignupStatus.failure,
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

  void updateDob(String dob) {
    emit(state.copyWith(dob: dob));
  }

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updatePhone(int? phone) {
    emit(state.copyWith(phone: phone));
  }

  void updateGender(Gender gender) {
    emit(state.copyWith(gender: gender));
  }

  void updateAgreeOnTerms(bool? agreed) {
    emit(state.copyWith(agreedOnTerms: agreed));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
