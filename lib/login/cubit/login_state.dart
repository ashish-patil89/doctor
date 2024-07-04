part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  checking,
  success,
  failure,
}

final class LoginState extends Equatable {
  const LoginState({
    this.loginStatus = LoginStatus.initial,
    this.email = '',
    this.password = '',
  });

  /// The status of [feedPublications].
  final LoginStatus loginStatus;

  final String email;
  final String password;

  @override
  List<Object?> get props => [
        loginStatus,
        email,
        password,
      ];

  LoginState copyWith({
    LoginStatus? loginStatus,
    String? email,
    String? password,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
