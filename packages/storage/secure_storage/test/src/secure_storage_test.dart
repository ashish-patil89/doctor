import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secure_storage/secure_storage.dart';
import 'package:storage/storage.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  const mockKey = 'mock-key';
  const mockValue = 'mock-value';
  final mockException = Exception('oops');

  group('SecureStorage', () {
    late FlutterSecureStorage flutterSecureStorage;
    late SecureStorage secureStorage;

    setUp(() {
      flutterSecureStorage = MockFlutterSecureStorage();
      secureStorage = SecureStorage(secureStorage: flutterSecureStorage);
    });

    group('constructor', () {
      test('defaults to internal FlutterSecureStorage if none is provided', () {
        expect(
          () => SecureStorage(secureStorage: MockFlutterSecureStorage()),
          isNot(
            throwsA(isA<Exception>()),
          ),
        );
      });
    });

    group('read', () {
      test(
          'returns a value when FlutterSecureStorage.read returns successfully',
          () async {
        when(() => flutterSecureStorage.read(key: any(named: 'key')))
            .thenAnswer((_) => Future.value(mockValue));
        final actual = await secureStorage.read(key: mockKey);
        expect(actual, mockValue);
      });

      test('returns null when FlutterSecureStorage.read returns null',
          () async {
        when(() => flutterSecureStorage.read(key: any(named: 'key')))
            .thenAnswer((_) => Future<String?>.value());
        final actual = await secureStorage.read(key: mockKey);
        expect(actual, isNull);
      });

      test('throws a StorageFailure when FlutterSecureStorage.read fails',
          () async {
        when(() => flutterSecureStorage.read(key: any(named: 'key')))
            .thenThrow(mockException);

        expect(
          () => secureStorage.read(key: mockKey),
          throwsA(isA<StorageFailure>()),
        );
      });
    });

    group('write', () {
      test('completes when FlutterSecureStorage.write completes', () async {
        when(
          () => flutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenAnswer((_) => Future.value());
        expect(
          secureStorage.write(key: mockKey, value: mockValue),
          completes,
        );
      });

      test('throws a StorageFailure when FlutterSecureStorage.write fails',
          () async {
        when(
          () => flutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenThrow(mockException);
        expect(
          () => secureStorage.write(key: mockKey, value: mockValue),
          throwsA(isA<StorageFailure>()),
        );
      });
    });

    group('delete', () {
      test('completes when FlutterSecureStorage.delete completes', () async {
        when(() => flutterSecureStorage.delete(key: any(named: 'key')))
            .thenAnswer((_) => Future.value());
        expect(
          secureStorage.delete(key: mockKey),
          completes,
        );
      });

      test('throws a StorageFailure when FlutterSecureStorage.delete fails',
          () async {
        when(() => flutterSecureStorage.delete(key: any(named: 'key')))
            .thenThrow(mockException);
        expect(
          () => secureStorage.delete(key: mockKey),
          throwsA(isA<StorageFailure>()),
        );
      });
    });

    group('clear', () {
      test('completes when FlutterSecureStorage.deleteAll completes', () async {
        when(() => flutterSecureStorage.deleteAll())
            .thenAnswer((_) => Future.value());
        expect(secureStorage.clear(), completes);
      });

      test('throws a StorageFailure when FlutterSecureStorage.deleteAll fails',
          () async {
        when(() => flutterSecureStorage.deleteAll()).thenThrow(mockException);
        expect(
          () => secureStorage.clear(),
          throwsA(isA<StorageFailure>()),
        );
      });
    });
  });
}
