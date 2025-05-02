import 'package:dart_basics/basics.dart';
import 'package:test/test.dart';

void main() {
   test('isInRange returns true when either number is in range', () {
    expect(isInRange(15, 5), isTrue);
    expect(isInRange(5, 35), isFalse);
    expect(isInRange(25, 30), isTrue);
    expect(isInRange(10, 40), isTrue);
    expect(isInRange(9, 9), isFalse);
  });
  test('startsWithFixVariant correctly identifies strings', () {
    expect(startsWithFixVariant("fix"), isTrue);
    expect(startsWithFixVariant("6ix"), isTrue);
    expect(startsWithFixVariant("mixing"), isTrue);
    expect(startsWithFixVariant("abc"), isFalse);
  });

  test('findLargest returns the largest number', () {
    expect(findLargest(1, 2, 3), equals(3));
    expect(findLargest(10, 5, 7), equals(10));
  });

  test('inSameRange verifies range inclusion', () {
    expect(inSameRange(22, 25), isTrue);
    expect(inSameRange(31, 39), isTrue);
    expect(inSameRange(21, 41), isFalse);
  });

  test('largerInRange checks the larger number in range', () {
    expect(largerInRange(25, 15), equals(25));
    expect(largerInRange(18, 19), equals(0));
  });

  test('sameLastDigit checks last digit match', () {
    expect(sameLastDigit(27, 37), isTrue);
    expect(sameLastDigit(10, 20), isTrue);
    expect(sameLastDigit(5, 12), isFalse);
  });

  test('lastThreeUpper modifies last three chars', () {
    expect(lastThreeUpper("hello"), equals("heLLO"));
    expect(lastThreeUpper("hi"), equals("hi"));
  });
}
