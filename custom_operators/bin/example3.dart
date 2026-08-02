void main(List<String> args) {
  print(add());
  print(add(1, null));
  print(add(null, 2));
  print(add(1, 2));
}

int add([int? a, int? b]) {
  return a + b;
}

extension NullableAdd<T extends num> on T? {
  T operator +(T? other) {
    final thisShadow = this;
    // if this != null and other == null, return this
    if (thisShadow != null && other == null) {
      return thisShadow;
    }
    // if thisShadow == null and other != null, return other
    else if (this == null && other != null) {
      return other;
    }
    // if thisShadow != null and other != null, return thisShadow + null
    else if (thisShadow != null && other != null) {
      return thisShadow + other as T;
    }
    // if thisShadow == null and other == null, return 0
    else {
      return 0 as T;
    }
  }
}
