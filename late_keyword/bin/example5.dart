void main(List<String> args) {
  final person = Person();
  person.description = 'Person Description 1';
  print(person.description);
  final dog = Dog();
  person.description = 'Person Description 2';
  print(person.description);
  dog.description = 'Dog Description 1';
  print(dog.description);
  try {
    dog.description = 'Dog Description 2';
    print(dog.description);
  } catch (e) {
    print(e);
  }
}

class Person {
  late String description;
}

class Dog {
  late final String description;
}
