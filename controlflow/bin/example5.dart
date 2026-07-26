void main(List<String> args) {
  describe(1);
  describe(1.1);
  describe('Hello');
  describe(true);
  describe({'key': 'value'});
  describe([1, 2, 3, 4]);
}

void describe<T>(T value) {
  switch (T) {
    case const (int):
      print("This is an integer: $value");
    case const (double):
      print('This is a double: $value');
    case const (String):
      print('This is a string: $value');
    case const (bool):
      print('this is a boolean: $value');
    case const (Map<String, String>):
      print('this is a map');
    default:
      print('This is something else');
  }
}
