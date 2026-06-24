void main(List<String> args) {
  String? lastName;
  print(lastName);
  lastName = null;
  doSomething(lastName, 'Bar');
  print(lastName);
}

void doSomething(String? one, String? two) {
  one ??= two;
  print(one);
}
