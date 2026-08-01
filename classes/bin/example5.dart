import 'dart:io';

void main(List<String> args) {
  final myCar = Car();
  print(myCar.speed);
  myCar.drive(speed: 50);
  print(myCar.speed);
  myCar.stop();
  print(myCar.speed);
}

class Car {
  int speed = 0;

  void drive({required int speed}) {
    this.speed = speed;
    print('Accelerating to $speed km/h');
    sleep(Duration(seconds: 2));
    print('driving at $speed km/h');
  }

  void stop() {
    speed = 0;
    print('Stopping...');
    sleep(Duration(seconds: 2));
    print('Stopped');
  }
}
