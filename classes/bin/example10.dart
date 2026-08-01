void main(List<String> args) {
  final car = Car(name: 'elmagnifico');
  print(car.kind);
  print(car.name);
  car.accelerate();
  car.deccelerate();

  final motorcycle = MotorCycle(name: 'elBrilliante');
  print(motorcycle.kind);
  print(motorcycle.name);
  motorcycle.accelerate();
  motorcycle.deccelerate();
}

abstract class Vehicle {
  final VehicleKind kind;

  Vehicle({required this.kind});

  abstract String name;

  void accelerate() => print('${kind.name} is accelerating');
  void deccelerate() => print('${kind.name} is decelerating');
}

class Car extends Vehicle {
  Car({required this.name}) : super(kind: VehicleKind.car);

  @override
  String name;
}

class MotorCycle implements Vehicle {
  @override
  void accelerate() => print('Motorcycle is accelerating');

  @override
  void deccelerate() => print('Motorcycle is decelerating');

  @override
  VehicleKind get kind => VehicleKind.motorcycle;

  MotorCycle({required this.name}) : super();

  @override
  String name;
}

enum VehicleKind {
  car,
  truck,
  motorcycle,
  bicycle,
}
