void main(List<String> args) {
  List<String?>? names;
  names?.add('Carmen');
  names?.add(null);
  print(names);
  final first = names?.first;
  print(first ?? 'No first name was found');
  names = [];
  names.add('Baz');
  print(names);
  names.add(null);
  print(names);
}
