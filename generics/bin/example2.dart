void main(List<String> args) {
  print(doTypesMatch('Hello', 'Hi'));
  print(doTypesMatch('Hello', 1));
}

bool doTypesMatch<L, R>(L a, R b) => L == R;
