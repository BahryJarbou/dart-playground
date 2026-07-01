void main(List<String> args) {
  final person = Person();
  print(person.description);
}

class Person {
  late String description = heavyCalaculationOfDescription();
  final int age;

  Person({this.age = 18}) {
    print('Consturctor is called');
  }

  String heavyCalaculationOfDescription() {
    print('Function "heavyCalculationOfDescription" is called');
    return 'Foo Bar';
  }
}
