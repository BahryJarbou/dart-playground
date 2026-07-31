import 'package:collection/collection.dart';

void main(List<String> args) {
  testBoolList();
  print('-------------------------');

  testCanonalizedMap();
  print('-------------------------');

  testCombinedIterableView();
  print('-------------------------');

  testCombinedListView();
  print('-------------------------');

  testCombinedMapView();
  print('-------------------------');

  testMapMerging();
  print('-------------------------');
}

void testMapMerging() {
  const info1 = {'name': 'John', 'age': 30, 'height': 1.8};
  const info2 = {'name': 'John', 'age': 31, 'height': 1.8, 'weight': 80};
  final mergedMaps = mergeMaps(info1, info2, value: (one, two) => two);
  print(mergedMaps);
}

void testCombinedMapView() {
  final map1 = {'a': 1, 'b': 2, 'c': 3};
  final map2 = {'b': 4, 'c': 5, 'd': 6};
  final map3 = {'c': 7, 'd': 8, 'e': 9};
  final combinedMap = CombinedMapView([map1, map2, map3]);
  print(combinedMap);
  print(combinedMap['a']);
  print(combinedMap['b']);
  print(combinedMap['c']);
  print(combinedMap['d']);
  print(combinedMap['e']);
  print(combinedMap['f']);
  try {
    combinedMap['a'] = 10;
  } catch (e) {
    print(e);
  }
}

void testCombinedListView() {
  final swedishNames = ['Sven', 'Karl', 'Gustav'];
  final norwegianNames = ['Sven', 'Karl', 'Ole'];
  final frenchNames = ['Jacquie', 'Michelle', 'Pierre'];
  final names = CombinedListView([swedishNames, norwegianNames, frenchNames]);
  print(names);
  if (names.contains('Sven')) {
    print('Sven is in the list');
  }
  try {
    names.removeAt(0);
  } catch (e) {
    print(e);
  }
}

void testCombinedIterableView() {
  final Iterable<int> one = [1, 2, 3];
  final two = [10, 20, 30];
  final Iterable<int> three = [40, 50, 60];
  var combined = CombinedIterableView([one, two, three]);
  print(combined);
  two.add(40);
  print(combined);
  print(combined.length);
  print(combined.isEmpty);
  print(combined.contains(5));
  print(combined.contains(10));
}

void testCanonalizedMap() {
  final info = {
    'name': 'John',
    'age': 30,
    'sex': 'male',
    'address': 'New York',
  };
  final canonMap = CanonicalizedMap.from(info, (key) {
    return key.length;
  });
  print(canonMap);
}

void testBoolList() {
  final boolList = BoolList(10, growable: true);
  print(boolList);
  boolList[3] = true;
  if (boolList[3]) {
    print('The boolean value at index 3 is true');
  } else {
    print('The boolean value at index 3 is false');
  }
  print(boolList);
  boolList.length *= 2;
  print(boolList);
}
