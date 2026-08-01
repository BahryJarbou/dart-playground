import 'dart:io';

void main(List<String> args) {
  final car = Car();
  car.drive(speed: 30);
  car.stop();
}

class Car {
  int _speed = 0;

  int get speed => _speed;
  set speed(int newSpeed) {
    if (newSpeed < 0) {
      throw Exception('Speed cannot be negative');
    } else {
      _speed = newSpeed;
    }
  }

  void drive({required int speed}) {
    try {
      this.speed = speed;
      print('Accelerating to $speed km/h');
      sleep(Duration(seconds: 2));
      print('driving at $speed km/h');
    } catch (e) {
      print(e);
    }
  }

  void stop() {
    if (speed != 0) {
      speed = 0;
      print('Stopping...');
      sleep(Duration(seconds: 2));
      print('Stopped');
    } else {
      print('Car already stationed');
    }
  }
}
