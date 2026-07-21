void main(List<String> args) {
  doSomethingWith(name: 'Foo');
  doSomethingWith(name: 'Bar');
  doSomethingWith2(name: null);
}

void doSomethingWith({required String name}) {
  print('Hello, $name!');
}

// can pass null as a value for the the required parameter
void doSomethingWith2({required String? name}) {
  print('Hello, $name!');
}
