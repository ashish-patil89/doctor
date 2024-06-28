part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  checking,
  success,
  failure,
}

final class LoginState extends Equatable {
  const LoginState({
    required this.loginStatus,
  });

  const LoginState.initial()
      : this(
          loginStatus: LoginStatus.initial,
        );

  /// The status of [feedPublications].
  final LoginStatus loginStatus;

  @override
  List<Object?> get props => [
        loginStatus,
      ];

  LoginState copyWith({
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
