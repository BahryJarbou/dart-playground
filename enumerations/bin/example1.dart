void main(List<String> args) {
  final woof = Animal(
    name: 'woof',
    type: AnimalType.dog,
  );

  if (woof.type == AnimalType.cat) {
    print('Woof is a cat');
  } else {
    print('Woof is not a cat');
  }

  switch (woof.type) {
    case AnimalType.dog:
      print('woof is a dog');
    case AnimalType.cat:
      print('woof is a cat');
    case AnimalType.rabbit:
      print('woof is a rabbit');
  }
}

enum AnimalType {
  rabbit,
  dog,
  cat,
}

class Animal {
  final String name;
  final AnimalType type;

  Animal({required this.name, required this.type});
}
