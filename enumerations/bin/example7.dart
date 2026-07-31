void main(List<String> args) {
  AnimalType.cat
    ..jump()
    ..run();
  AnimalType.dog
    ..jump()
    ..run;
  AnimalType.rabbit
    ..jump()
    ..run();
}

enum AnimalType {
  cat,
  dog,
  rabbit;

  void run() {
    print('Running...');
  }
}

extension Jump on AnimalType {
  void jump() {
    print('$name is jumping...');
  }
}
