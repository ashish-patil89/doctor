import 'package:equatable/equatable.dart';

/// {@template community_failure}
/// A base failure for the community repository.
/// {@endtemplate}
sealed class UserFailure with EquatableMixin implements Exception {
  /// {@macro community_failure}
  const UserFailure(this.error);

  /// The associated error.
  final Object error;

  @override
  List<Object> get props => [error];
}

///
class SignupFailedFailure extends UserFailure {
  /// {@macro get_next_community_items_failure}
  const SignupFailedFailure(super.error);
}

///
class EmailFailedFailure extends UserFailure {
  /// {@macro get_next_community_items_failure}
  const EmailFailedFailure(super.error);
}

///
class PhoneFailedFailure extends UserFailure {
  /// {@macro get_next_community_items_failure}
  const PhoneFailedFailure(super.error);
}

///
class PasswordFailedFailure extends UserFailure {
  /// {@macro get_next_community_items_failure}
  const PasswordFailedFailure(super.error);
}
