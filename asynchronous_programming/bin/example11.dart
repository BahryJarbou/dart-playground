void main(List<String> args) async {
  final names = await getNames().toList();
  for (final name in names) {
    print(name);
  }
}

Stream<String> getNames() async* {
  yield 'John';
  yield 'Jane';
  yield 'Jack';
}
