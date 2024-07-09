import 'package:equatable/equatable.dart';

/// {@template storage}
/// An abstract key/value storage client.
/// {@endtemplate}
abstract class Storage {
  /// {@macro storage}
  const Storage();

  /// Returns value for the provided [key].
  /// Read returns `null` if no value is found for the given [key].
  ///
  /// Throws a [StorageFailure] if an exception occurs.
  Future<String?> read({required String key});

  /// Writes the provided [key], [value] pair asynchronously.
  ///
  /// Throws a [StorageFailure] if an exception occurs.
  Future<void> write({required String key, required String value});

  /// Removes the value for the provided [key] asynchronously.
  ///
  /// Throws a [StorageFailure] if an exception occurs.
  Future<void> delete({required String key});

  /// Removes all key, value pairs asynchronously.
  ///
  /// Throws a [StorageFailure] if an exception occurs.
  Future<void> clear();
}

/// {@template storage_failure}
/// Thrown when a storage operation fails.
/// {@endtemplate}
class StorageFailure with EquatableMixin implements Exception {
  /// {@macro storage_failure}
  const StorageFailure(this.error);

  /// The associated error.
  final Object error;

  @override
  List<Object> get props => [error];
}
