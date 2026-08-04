void main(List<String> args) {
  const one = KeyValue(1, 2);
  print(one);
  const two = KeyValue(1, 2.2);
  print(two);
  const three = KeyValue(1, 'Foo');
  print(three);
  const KeyValue four = KeyValue(1, 2);
  print(four);
}

typedef KeyValue<K, V> = MapEntry<K, V>;
