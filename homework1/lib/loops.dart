import 'dart:io';

void squaresFrom10To20() {
  for (int i = 10; i <= 20; i++) {
    print('${i * i}');
  }
}

void sumToN() {
  stdout.write('Enter a number n: ');
  int n = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  print('Sum from 1 to $n is $sum');
}

void depositAfterYears() {
  stdout.write('Enter deposit amount (S): ');
  double s = double.parse(stdin.readLineSync()!);
  stdout.write('Enter number of years (N): ');
  int n = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < n; i++) {
    s *= 1.03;
  }
  print('Amount after $n years: ${s.toStringAsFixed(2)}');
}

void divisibleBy3Not5() {
  for (int i = 20; i <= 50; i++) {
    if (i % 3 == 0 && i % 5 != 0) {
      print(i);
    }
  }
}

void sumDivBy5Or7() {
  int sum = 0;
  for (int i = 1; i <= 50; i++) {
    if (i % 5 == 0 || i % 7 == 0) {
      sum += i;
    }
  }
  print('Sum of numbers divisible by 5 or 7 from 1 to 50: $sum');
}

void twoDigitDiv4Not6() {
  for (int i = 10; i <= 99; i++) {
    if (i % 4 == 0 && i % 6 != 0) {
      print(i);
    }
  }
}

void sumMultiplesOf17() {
  int sum = 0;
  for (int i = 100; i <= 200; i++) {
    if (i % 17 == 0) {
      sum += i;
    }
  }
  print('Sum of numbers from 100 to 200 that are multiples of 17: $sum');
}

void sumSquaresToN() {
  stdout.write('Enter a number N: ');
  int n = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i * i;
  }
  print('Sum of squares from 1 to $n is $sum');
}