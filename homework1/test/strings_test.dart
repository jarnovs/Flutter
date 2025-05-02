import 'package:dart_basics/strings.dart';
import 'package:test/test.dart';

void main(){
    test('lastTwoTwice creates a string of last two chars repeated', () {
    expect(lastTwoTwice("hello"), equals("lolo"));
    expect(lastTwoTwice("ab"), equals("abab"));
  });

  test('firstTwoOrAll returns first two or full string if shorter', () {
    expect(firstTwoOrAll("hello"), equals("he"));
    expect(firstTwoOrAll("a"), equals("a"));
  });

  test('firstHalf returns first half of even-length string', () {
    expect(firstHalf("hello"), equals("he"));
    expect(firstHalf("abcdef"), equals("abc"));
  });

  test('removeFirstLast removes first and last characters', () {
    expect(removeFirstLast("hello"), equals("ell"));
    expect(removeFirstLast("ab"), equals(""));
  });

  test('shortLongShort creates short+long+short pattern', () {
    expect(shortLongShort("hi", "hello"), equals("hihellohi"));
    expect(shortLongShort("abc", "a"), equals("aabca"));
  });

  test('moveFirstTwoToEnd moves first two characters to end', () {
    expect(moveFirstTwoToEnd("hello"), equals("llohe"));
    expect(moveFirstTwoToEnd("ab"), equals("ab"));
  });
}