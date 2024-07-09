import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  const mockKey = 'mock-key';
  const mockValue = 'mock-value';
  final mockException = Exception('oops');

  group('PersistentStorage', () {
    late SharedPreferences sharedPreferences;
    late PersistentStorage persistentStorage;

    setUp(() {
      sharedPreferences = MockSharedPreferences();
      persistentStorage = PersistentStorage(
        sharedPreferences: sharedPreferences,
      );
    });

    group('read', () {
      test('returns value when SharedPreferences returns successfully',
          () async {
        when(() => sharedPreferences.getString(any()))
            .thenAnswer((_) => mockValue);
        final actual = await persistentStorage.read(key: mockKey);
        expect(actual, mockValue);
      });

      test('returns null when SharedPreferences.getString returns null',
          () async {
        when(() => sharedPreferences.getString(any())).thenAnswer((_) => null);
        final actual = await persistentStorage.read(key: mockKey);
        expect(actual, isNull);
      });

      test('throws a StorageFailure when SharedPreferences.getString fails',
          () async {
        when(() => sharedPreferences.getString(any())).thenThrow(mockException);
        expect(
          () => persistentStorage.read(key: mockKey),
          throwsA(isA<StorageFailure>()),
        );
      });
    });

    group('write', () {
      test('completes when SharedPreferences.setString completes', () async {
        when(() => sharedPreferences.setString(any(), any()))
            .thenAnswer((_) => Future.value(true));
        expect(
          persistentStorage.write(key: mockKey, value: mockValue),
          completes,
        );
      });

      test('throws a StorageFailure when SharedPreferences.setString fails',
          () async {
        when(() => sharedPreferences.setString(any(), any()))
            .thenThrow(mockException);
        expect(
          () => persistentStorage.write(key: mockKey, value: mockValue),
          throwsA(isA<StorageFailure>()),
        );
      });
    });

    group('delete', () {
      test('completes when SharedPreferences.remove completes', () async {
        when(() => sharedPreferences.remove(any()))
            .thenAnswer((_) => Future.value(true));
        expect(
          persistentStorage.delete(key: mockKey),
          completes,
        );
      });

      test('throws a StorageFailure when SharedPreferences.remove fails',
          () async {
        when(() => sharedPreferences.remove(any())).thenThrow(mockException);
        expect(
          () => persistentStorage.delete(key: mockKey),
          throwsA(isA<StorageFailure>()),
        );
      });
    });

    group('clear', () {
      test('completes when SharedPreferences.clear completes', () async {
        when(() => sharedPreferences.clear())
            .thenAnswer((_) => Future.value(true));
        expect(persistentStorage.clear(), completes);
      });

      test('throws a StorageFailure when SharedPreferences.clear fails',
          () async {
        when(() => sharedPreferences.clear()).thenThrow(mockException);
        expect(
          () => persistentStorage.clear(),
          throwsA(isA<StorageFailure>()),
        );
      });
    });
  });
}
