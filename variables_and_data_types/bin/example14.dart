void main(List<String> args) {
  const TheirNames = ['Alice', 'Bob', 'Carol'];
  print(TheirNames);

  // ignore: non_constant_identifier_names
  final Wow = 'Wow';
  print(Wow);

  // ignore: constant_identifier_names
  const SomeName = 'Bahry';
  print(SomeName);
}
