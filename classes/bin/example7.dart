void main(List<String> args) {
  print(Car.carInstantiated);
  Car(name: 'My Car');
  print(Car.carInstantiated);
  Car(name: 'Your Car');
  print(Car.carInstantiated);
}

class Car {
  static int _carInstantiated = 0;

  static int get carInstantiated => _carInstantiated;
  static void _incrementCarsIstantiated() => _carInstantiated++;

  final String name;

  Car({required this.name}) {
    _incrementCarsIstantiated();
  }
}
