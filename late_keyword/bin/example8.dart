void main(List<String> args) {
  print('late fullName is being initialized');
  late final fullName = getFullName();
  final resolvedFullName = fullName;
  print('after');
  print('resolvedFullName: $resolvedFullName');
}

String getFullName() {
  print('getFullName() is called');
  return 'John Doe';
}
