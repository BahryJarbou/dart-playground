void main(List<String> args) {
  descirbeFully('Foo', lastName: 'Bar');
  descirbeFully('Foo', lastName: null);
  descirbeFully('Foo', lastName: 'Baz');
}

void descirbeFully(String firstName, {String? lastName = 'Bar'}) {
  print('Hello $firstName $lastName');
}
