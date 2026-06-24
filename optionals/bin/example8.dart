void main(List<String> args) {
  final String? firstName = 'Foo';

  if (firstName == null) {
    print('firstName value is null');
  } else {
    final length = firstName.length;
    print('length of firstName = $length');
  }
}
