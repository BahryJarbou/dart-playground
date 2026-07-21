void main(List<String> args) {
  makeUpperCase();
  // this is not necessary, default value for the first parameter is null
  makeUpperCase(null);
  makeUpperCase('Foo');
  // this is not allowed since the second positional parameter is not nullable (of type String)
  // makeUpperCase('Foo', null);
  makeUpperCase('Foo', 'Bar');
}

void makeUpperCase([String? name, String lastName = 'Doe']) {
  print(name?.toUpperCase());
  print(lastName.toUpperCase());
}
