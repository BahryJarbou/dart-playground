void main(List<String> args) {
  describePerson();
  describePerson(name: 'Foo');
  describePerson(age: 32);
  describePerson(name: 'Foo', age: 32);
  describePerson(age: 32, name: 'Foo');
}

void describePerson({String? name, int? age}) {
  print('Hello $name, you are $age years old.');
}
