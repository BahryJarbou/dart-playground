void main(List<String> args) {
  final double doubleValue = eitherIntOrDouble();
  print(doubleValue);
  final int intValue = eitherIntOrDouble();
  print(intValue);
}

T eitherIntOrDouble<T extends num>() {
  switch (T) {
    case const (int):
      return 1 as T;
    case const (double):
      return 1.1 as T;
    default:
      throw Exception('Not supported');
  }
}
