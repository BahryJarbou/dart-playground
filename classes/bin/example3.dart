void main(List<String> args) {
  final v = Vehicle(4);
  print(v);
  print(v.toString());
  print('-------------------');

  final car = Car();
  print(car);
  print('-------------------');

  final bicycle = Bicycle();
  print(bicycle);
  print('-------------------');
}

class Vehicle {
  final int wheelCount;
  const Vehicle(this.wheelCount);

  @override
  toString() {
    // if (runtimeType == Vehicle) {
    //   return 'Vehicle with $wheelCount wheels';
    // } else {
    //   return super.toString();
    // }
    return '$runtimeType with $wheelCount wheels';
  }
}

class Car extends Vehicle {
  const Car() : super(4);
}

class Bicycle extends Vehicle {
  const Bicycle() : super(2);
}
