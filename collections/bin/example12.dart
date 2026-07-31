void main(List<String> args) {
  addToArrayWrong();
  addToArrayRight();
  addDictionaryWrong();
  addDictionaryRight();
}

void addToArrayWrong() {
  final names1 = ['Foo1', 'Bar1', 'Baz1'];
  final names2 = ['Foo2', 'Bar2', 'Baz2'];
  final allNamesWrong = names1;
  allNamesWrong.addAll(names2);
  print(names1);
  print(names2);
  print(allNamesWrong);
  print('------------------------------');
}

void addToArrayRight() {
  final names1 = ['Foo1', 'Bar1', 'Baz1'];
  final names2 = ['Foo2', 'Bar2', 'Baz2'];
  final allNamesRight = [...names1, ...names2];
  print(names1);
  print(names2);
  print(allNamesRight);
  print('------------------------------');
  final anotherWay = [...names1]..addAll(names2);
  print(names1);
  print(names2);
  print(anotherWay);
  print('------------------------------');
  final namesList = {...names1}..addAll(names2);
  print(namesList);
  print('------------------------------');
}

void addDictionaryWrong() {
  const info = {'name': 'Foo', 'age': 20, 'height': 1.8};
  try {
    final result = info;
    result.addAll({'weight': 80});
  } catch (e) {
    print(e);
  }
  print('------------------------------');
}

void addDictionaryRight() {
  const info = {'name': 'Foo', 'age': 20, 'height': 1.8};
  final result = {...info}..addAll({'weight': 80});
  print(result);
  print('------------------------------');
}
