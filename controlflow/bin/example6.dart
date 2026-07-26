void main(List<String> args) {
  const info = {
    'name': 'John',
    'age': 30,
    'height': 1.8,
    'isMarried': false,
    'address': {
      'street': {
        'name': 'Main Street',
        'details': {'number': 10, 'additional': 'block A'},
      },
      'city': 'New York',
      'country': 'USA',
    },
  };

  printMap(info, 0);

  // for (final entry in info.entries) {
  //   print('${entry.key}: ${entry.value}');
  // }
}

void printMap(Map a, int endent) {
  for (final entry in a.entries) {
    if (entry.value case Map _) {
      print('${'    ' * endent}${entry.key}:');
      printMap(entry.value, endent + 1);
    } else {
      print('${'    ' * endent}${entry.key}: ${entry.value}');
    }
  }
}
