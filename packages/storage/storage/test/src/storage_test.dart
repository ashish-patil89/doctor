// This package is just an abstraction.
// See secure_storage for a concrete implementation.

// ignore_for_file: prefer_const_constructors

import 'package:storage/storage.dart';
import 'package:test/fake.dart';
import 'package:test/test.dart';

// Storage is exported and can be implemented.
class FakeStorage extends Fake implements Storage {}

// Failure is exported and can be implemented.
class FakeStorageFailure extends Fake implements StorageFailure {}

void main() {
  test('Storage can be implemented', () {
    expect(FakeStorage.new, returnsNormally);
  });

  test('exports StorageFailure', () {
    expect(() => FakeStorageFailure.new, returnsNormally);
  });
}
