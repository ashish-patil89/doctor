part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  checking,
  success,
  failure,
}

enum Gender {
  male,
  female,
  other,
}

final class SignupState extends Equatable {
  const SignupState({
    this.signupStatus = SignupStatus.initial,
    this.email,
    this.password,
    this.name,
    this.agreedOnTerms = false,
    this.signupInvalid,
    this.emailInvalid,
    this.passwordInvalid,
  });

  /// The status of [feedPublications].
  final SignupStatus signupStatus;

  final String? email;
  final String? password;
  final String? name;
  final bool agreedOnTerms;
  final String? signupInvalid;
  final String? emailInvalid;
  final String? passwordInvalid;

  @override
  List<Object?> get props => [
        signupStatus,
        email,
        password,
        name,
        agreedOnTerms,
        signupInvalid,
        emailInvalid,
        passwordInvalid,
      ];

  SignupState copyWith({
    SignupStatus? loginStatus,
    String? email,
    String? password,
    String? name,
    bool? agreedOnTerms,
    String? signupInvalid,
    String? emailInvalid,
    String? passwordInvalid,
  }) {
    return SignupState(
      signupStatus: loginStatus ?? this.signupStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      agreedOnTerms: agreedOnTerms ?? this.agreedOnTerms,
      signupInvalid: signupInvalid ?? this.signupInvalid,
      emailInvalid: emailInvalid ?? this.emailInvalid,
      passwordInvalid: passwordInvalid ?? this.passwordInvalid,
    );
  }
}
