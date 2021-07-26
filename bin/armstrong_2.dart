import 'dart:io';

void main() {
  print('Введите натуральное число:');
  var readLine = stdin.readLineSync()!;
  var length = readLine.length;
  BigInt number, digit, sum = BigInt.zero;

  var value = BigInt.tryParse(readLine);

  if (value != null) {
    if (value.isNegative) {
      print('Отрицательные числа к натуральным не относят.');
      exit(0);
    }
    
    number = value;
    
    while (number != BigInt.zero) {
      digit = number % BigInt.from(10);
      sum += BigInt.from(digit.toInt()).pow(length);
      number = number ~/ BigInt.from(10);
    }

    if (value == sum) {
      print('Число $readLine является Числом Армстронга.');
    } else {
      print('Число $readLine не является Числом Армстронга.');
    }
  } else {
    print('Ошибка! Необходимо ввести натуральное число.');
  }

}