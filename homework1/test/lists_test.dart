import 'package:dart_basics/lists.dart';
import 'package:test/test.dart';

void main(){
  test('containsTwice detects numbers appearing twice', () {
    expect(containsTwice([3, 1, 3, 5], 3), isTrue);
    expect(containsTwice([5, 5, 1, 2], 5), isTrue);
    expect(containsTwice([1, 2, 3, 4], 3), isFalse);
  });

  test('bothStartWithZero checks first element', () {
    expect(bothStartWithZero([0, 2], [0, 3]), isTrue);
    expect(bothStartWithZero([1, 2], [0, 3]), isFalse);
  });

  test('largestSumArray returns the array with the largest sum', () {
    expect(largestSumArray([1, 2], [3, 4]), equals([3, 4]));
    expect(largestSumArray([5, 5], [4, 6]), equals([5, 5]));
  });

  test('middleTwo extracts middle two elements', () {
    expect(middleTwo([1, 2, 3, 4]), equals([2, 3]));
  });

  test('combineArrays merges two arrays', () {
    expect(combineArrays([1, 2], [3, 4]), equals([1, 2, 3, 4]));
  });

  test('swapFirstLast swaps elements', () {
    expect(swapFirstLast([1, 2, 3]), equals([3, 2, 1]));
  });

  test('middleThree extracts middle three elements', () {
    expect(middleThree([1, 2, 3, 4, 5]), equals([2, 3, 4]));
  });

  test('largestOfThree finds the largest value', () {
    expect(largestOfThree([1, 5, 3]), equals(5));
  });

  test('firstTwo extracts first two elements', () {
    expect(firstTwo([1]), equals([1]));
    expect(firstTwo([1, 2, 3]), equals([1, 2]));
  });
}