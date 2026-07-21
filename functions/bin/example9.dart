void main(List<String> args) {
  doSomethingWithAge(age: 42);
  doSomethingWithAge(age: null);
}

void doSomethingWithAge({required int? age}) {
  if (age != null) {
    final in2Years = age + 2;
    print('In 2 years, you wil be $in2Years years old.');
  } else {
    print('You didn\'t tell me your age');
  }
}

// required parameters cannot have default value
