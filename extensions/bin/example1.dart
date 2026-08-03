void main(List<String> args) {
  final string = 'Hello';
  print(string.reversed);
}

extension on String {
  String get reversed => split('').reversed.join();
}
