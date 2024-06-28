import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_base_state.dart';

class AppBaseCubit extends Cubit<AppBaseState> {
  AppBaseCubit()
      : super(
          const AppBaseState(),
        );
}
