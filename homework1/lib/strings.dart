String lastTwoTwice(String str) {
  String lastTwo = str.substring(str.length - 2);
  return lastTwo + lastTwo;
}

String firstTwoOrAll(String str) {
  return str.length < 2 ? str : str.substring(0, 2);
}

String firstHalf(String str) {
  return str.substring(0, str.length ~/ 2);
}

String removeFirstLast(String str) {
  return str.substring(1, str.length - 1);
}

String shortLongShort(String a, String b) {
  return a.length < b.length ? a + b + a : b + a + b;
}

String moveFirstTwoToEnd(String str) {
  return str.substring(2) + str.substring(0, 2);
}