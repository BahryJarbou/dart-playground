void main(List<String> args) {
  const foo = Person(firstName: 'Foo', lastName: 'Bar');
  print(foo.fullName);
  print('---------------------------');

  const foo2 = Person2(firstName: 'Foo', lastName: 'Bar');
  print(foo2.fullName);
  print('---------------------------');
}

class Person {
  final String firstName;
  final String lastName;
  String get fullName => '$firstName $lastName';

  const Person({required this.firstName, required this.lastName});
}

class Person2 {
  final String firstName;
  final String lastName;
  final String fullName;

  const Person2({
    required this.firstName,
    required this.lastName,
  }) : fullName = '$firstName $lastName';
}
