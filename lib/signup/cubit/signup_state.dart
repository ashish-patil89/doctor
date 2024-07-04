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
    this.phone,
    this.dob,
    this.gender = Gender.male,
    this.agreedOnTerms = false,
  });

  /// The status of [feedPublications].
  final SignupStatus signupStatus;

  final String? email;
  final String? password;
  final String? name;
  final int? phone;
  final String? dob;
  final Gender gender;
  final bool agreedOnTerms;

  @override
  List<Object?> get props => [
        signupStatus,
        email,
        password,
        name,
        phone,
        dob,
        gender,
        agreedOnTerms,
      ];

  SignupState copyWith({
    SignupStatus? loginStatus,
    String? email,
    String? password,
    String? name,
    int? phone,
    String? dob,
    Gender? gender,
    bool? agreedOnTerms,
  }) {
    return SignupState(
      signupStatus: loginStatus ?? this.signupStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      agreedOnTerms: agreedOnTerms ?? this.agreedOnTerms,
    );
  }
}
