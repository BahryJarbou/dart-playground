void main(List<String> args) {
  final person = Person();
  person.jump(speed: 20.0);
  person.walk(speed: 10.0);
  person.doubleJump();
}

mixin HasSpeed {
  abstract double speed;
}

mixin CanJump on HasSpeed {
  void jump({required double speed}) {
    print('$runtimeType is jumping at the speed of $speed');
    this.speed = speed;
  }

  void doubleJump();
}

mixin CanWalk on HasSpeed {
  void walk({required double speed}) {
    print('$runtimeType is walking at the speed of $speed');
    this.speed = speed;
  }
}

class Person with HasSpeed, CanJump, CanWalk {
  @override
  double speed;

  Person() : speed = 0.0;

  @override
  void doubleJump() {
    print('Person double jumped');
  }
}
