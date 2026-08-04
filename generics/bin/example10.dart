void main(List<String> args) {
  final personName =
      personThing.mapIfOfType(
        (Person p) => p.name,
      ) ??
      'Unknown Person name';
  print(personName);

  final animalName =
      animalThing.mapIfOfType(
        (Animal a) => a.name,
      ) ??
      'Unknown animal name';
  print(animalName);
}

abstract class Thing {
  final String name;

  const Thing({required this.name});
}

class Person extends Thing {
  final int age;

  const Person({
    required super.name,
    required this.age,
  });
}

class Animal extends Thing {
  final String species;

  const Animal({
    required super.name,
    required this.species,
  });
}

const Thing personThing = Person(
  name: 'Foo',
  age: 20,
);

const Thing animalThing = Animal(
  name: 'Bar',
  species: 'Cat',
);

extension<T> on T {
  R? mapIfOfType<E, R>(R Function(E) f) {
    final shadow = this;
    if (shadow is E) {
      return f(shadow);
    } else {
      return null;
    }
  }
}
