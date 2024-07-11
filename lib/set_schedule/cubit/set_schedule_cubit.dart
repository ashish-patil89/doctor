import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'set_schedule_state.dart';

class SetScheduleCubit extends Cubit<SetScheduleState> {
  SetScheduleCubit({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(SetScheduleState()) {}

  final UserRepository _userRepository;

  @override
  Future<void> close() {
    return super.close();
  }
}
