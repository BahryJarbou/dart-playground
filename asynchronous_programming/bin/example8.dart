void main(List<String> args) async {
  final names = allNames();
  await for (final name in names) {
    print(name);
  }
}

Stream<String> maleNames() async* {
  yield 'John';
  yield 'Peter';
  yield 'Paul';
}

Stream<String> femaleNames() async* {
  yield 'Mary';
  yield 'Jane';
  yield 'Sue';
}

Stream<String> allNames() async* {
  yield* maleNames();
  yield* femaleNames();
}
