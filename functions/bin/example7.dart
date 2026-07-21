void main(List<String> args) {
  doSomethingWith();
  doSomethingWith(name: 'Foo');
  // you can't pass null like this:
  // doSomethingWith(name: null);
}

void doSomethingWith({String name = 'Bar'}) {
  print('Hello, $name!');
}
