void main(List<String> args) {
  int? age = 10;
  print(age.orDefault);
  double? bill = 12.2;
  print(bill.orDefault);
  String? name = 'John';
  print(name.orDefault);
  bool? isRegistered = true;
  print(isRegistered.orDefault);
  print(fullName('John', null));
}

String fullName(String? firstName, String? lastName) =>
    '${firstName.orDefault} ${lastName.orDefault}';

extension DefaultValues<T> on T? {
  T get orDefault {
    final shadow = this;
    if (shadow != null) {
      return shadow;
    } else {
      switch (T) {
        case const (int):
          return 0 as T;
        case const (double):
          return 0.0 as T;
        case const (String):
          return '_' as T;
        case const (bool):
          return false as T;
        default:
          throw Exception('No default value for type $T');
      }
    }
  }
}
