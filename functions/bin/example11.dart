void main(List<String> args) {
  //   sayGoodbyeTo();
  //   sayGoodbyeTo('Foo');
  sayGoodbyeTo('Foo', 'Bar');
  sayGoodbyeTo('Baz', 'Bar');
}

void sayGoodbyeTo(String person, String andOtherPerson) {
  print('Goodbye $person and $andOtherPerson');
}
