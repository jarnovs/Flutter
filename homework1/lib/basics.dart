bool isInRange(int a, int b) {
  return (a >= 10 && a <= 30) || (b >= 10 && b <= 30);
}

bool startsWithFixVariant(String str) {
  return str.length >= 3 &&
      (str.startsWith('fix') || str.substring(1, 3) == 'ix');
}

int findLargest(int a, int b, int c) {
  return [a, b, c].reduce((x, y) => x > y ? x : y);
}

bool inSameRange(int a, int b) {
  bool bothIn20s = a >= 20 && a <= 30 && b >= 20 && b <= 30;
  bool bothIn30s = a >= 30 && a <= 40 && b >= 30 && b <= 40;
  return bothIn20s || bothIn30s;
}

int largerInRange(int a, int b) {
  bool aInRange = a >= 20 && a <= 30;
  bool bInRange = b >= 20 && b <= 30;

  if (aInRange && bInRange) {
    return a > b ? a : b;
  } else if (aInRange) {
    return a;
  } else if (bInRange) {
    return b;
  }

  return 0;
}

bool sameLastDigit(int a, int b) {
  return (a % 10) == (b % 10);
}

String lastThreeUpper(String str) {
  if (str.length < 3) return str.toLowerCase();
  return str.substring(0, str.length - 3) +
      str.substring(str.length - 3).toUpperCase();
}

bool hasDoubleA(String str) {
  int index = str.indexOf('a');
  return index != -1 &&
      index + 1 < str.length &&
      str[index + 1] == 'a';
}