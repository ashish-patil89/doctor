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
    this.isValidSession = false,
  });

  /// The status of [feedPublications].
  final LoginStatus loginStatus;

  final String email;
  final String password;
  final bool isValidSession;

  @override
  List<Object?> get props => [
        loginStatus,
        email,
        password,
        isValidSession,
      ];

  LoginState copyWith({
    LoginStatus? loginStatus,
    bool? isValidSession,
    String? email,
    String? password,
  }) {
    return LoginState(
      isValidSession: isValidSession ?? this.isValidSession,
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
