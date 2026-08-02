void main(List<String> args) {
  print('THE HUSAND:');
  final husband = Person(name: 'John');
  final cat = Pet(name: 'whiskers');
  final family1 = husband & cat;
  print(husband);
  print(cat);
  print(family1);
  print('-------------------------');

  print('THE WIFE:');
  final wife = Person(name: 'Jane');
  final dog = Pet(name: 'Woof');
  final family2 = wife & dog;
  print(wife);
  print(dog);
  print(family2);
  print('-------------------------');

  print('THE MARRIAGE:');
  final family3 = family1 ^ family2;
  print(family3);
  print('-------------------------');

  print('THE FIRST BORN:');
  final child = Person(name: 'June');
  final family4 = family3 + child;
  print(family4);
  print('-------------------------');

  print('THE RABBIT:');
  final rabbit = Pet(name: 'Roy');
  final family5 = family4 & rabbit;
  print(family5);
  print('-------------------------');

  print('THE IN LAW:');
  final sonInLaw = Person(name: 'Jan');
  final family6 = child + sonInLaw;
  print(family6);
  print('-------------------------');
}

class Person {
  final String name;

  Person({required this.name});

  @override
  String toString() => 'Person (name = $name)';
}

class Pet {
  final String name;

  Pet({required this.name});

  @override
  String toString() => 'Pet (name = $name)';
}

class Family {
  final List<Person> members;
  final List<Pet> pets;

  Family({required this.members, required this.pets});

  @override
  String toString() => 'Family (members = $members, pets = $pets)';
}

extension on Person {
  Family operator +(Person other) => Family(
    members: [this, other],
    pets: [],
  );

  Family operator &(Pet other) => Family(
    members: [this],
    pets: [other],
  );
}

extension on Family {
  Family operator +(Person other) =>
      Family(members: [...members, other], pets: pets);

  Family operator &(Pet other) =>
      Family(members: members, pets: [...pets, other]);

  Family operator ^(Family other) => Family(
    members: [...members, ...other.members],
    pets: [...pets, ...other.pets],
  );
}
