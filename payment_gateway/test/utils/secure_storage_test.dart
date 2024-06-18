import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:payment_gateway/utils/secure_storage.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late SecureStorage secureStorage;
  late MockFlutterSecureStorage mockStorage;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    secureStorage = FlutterSecureStorageImpl(storage: mockStorage);
  });

  group('write', () {
    test('should call FlutterSecureStorage to write data', () async {
      when(() => mockStorage.write(key: 'key1', value: anyNamed('value')))
          .thenAnswer((_) => Future<void>.value());

      await secureStorage.write('key1', 'value1');

      verify(() => mockStorage.write(key: 'key1', value: 'value1')).called(1);
    });
  });

  group('read', () {
    test('should call FlutterSecureStorage to read data', () async {
      when(() => mockStorage.read(key: 'key1')).thenAnswer((_) async => 'value1');

      final result = await secureStorage.read('key1');

      expect(result, 'value1');
      verify(() => mockStorage.read(key: 'key1')).called(1);
    });
  });

  group('delete', () {
    test('should call FlutterSecureStorage to delete a key', () async {
      when(() => mockStorage.delete(key: 'key1')).thenAnswer((_) async => Future<void>.value());

      await secureStorage.delete('key1');

      verify(() => mockStorage.delete(key: 'key1')).called(1);
    });
  });

  group('deleteAll', () {
    test('should call FlutterSecureStorage to delete all keys', () async {
      when(() => mockStorage.deleteAll()).thenAnswer((_) async => Future<void>.value());

      await secureStorage.deleteAll();

      verify(() => mockStorage.deleteAll()).called(1);
    });
  });
}