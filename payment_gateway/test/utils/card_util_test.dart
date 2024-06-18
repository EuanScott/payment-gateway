import 'package:flutter_test/flutter_test.dart';
import 'package:payment_gateway/utils/card_util.dart';

void main() {
  group('CardUtils', () {
    group('getCleanedNumber', () {
      test('should remove non-numeric characters from the input', () {
        final result = CardUtils.getCleanedNumber('123abc456def');
        expect(result, '123456');
      });

      test('should return an empty string if the input contains no numbers', () {
        final result = CardUtils.getCleanedNumber('abcdef');
        expect(result, '');
      });

      test('should return the same string if the input contains only numbers', () {
        final result = CardUtils.getCleanedNumber('123456');
        expect(result, '123456');
      });
    });

    group('getCardTypeFrmNumber', () {
      test('should return Master for a MasterCard number', () {
        final result = CardUtils.getCardTypeFrmNumber('5555555555554444');
        expect(result, 'Master');
      });

      test('should return Visa for a Visa card number', () {
        final result = CardUtils.getCardTypeFrmNumber('4111111111111111');
        expect(result, 'Visa');
      });

      test('should return Other for a number that does not match any card type', () {
        final result = CardUtils.getCardTypeFrmNumber('1234567890123456');
        expect(result, 'Other');
      });
    });
  });
}