import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:platform/platform.dart';
import 'package:user_repository/user_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required UserRepository userRepository,
    Platform localPlatform = const LocalPlatform(),
  })  : _userRepository = userRepository,
        _localPlatform = localPlatform,
        super(const HomeState()) {}

  final UserRepository _userRepository;
  final Platform _localPlatform;

  @override
  Future<void> close() {
    return super.close();
  }
}
