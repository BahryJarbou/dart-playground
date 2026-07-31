void main(List<String> args) {
  final string = 'abracadabra';
  var allExceptAbc =
      {for (final char in string.split('')) 'abc'.contains(char) ? null : char}
        ..removeAll([null])
        ..cast<String>();
  print(allExceptAbc);
  print('-----------------------------');

  var allExceptAbc2 = {
    for (final char in string.split(''))
      if (!'abc'.contains(char)) char,
  };
  print(allExceptAbc2);
  print('-----------------------------');

  final allNumbers = Iterable.generate(100);
  final evenNumbers = [
    for (final number in allNumbers)
      if (number % 2 == 0) number,
  ];
  print(evenNumbers);
  print('-----------------------------');

  final evenNumberFunctional = allNumbers.where((number) => number % 2 == 0);
  print(evenNumberFunctional);
  print('-----------------------------');

  final oddNumbers = [
    for (final number in allNumbers)
      if (number % 2 != 0) number,
  ];
  print(oddNumbers);
  print('-----------------------------');

  final oddNumbersFunctional = allNumbers.where((number) => number % 2 != 0);
  print(oddNumbersFunctional);
  print('-----------------------------');

  final names = ['John Doe', 'James Smith', 'Alice Jones'];
  final namesAndLength = {for (final name in names) name: name.length};
  print(namesAndLength);
}
