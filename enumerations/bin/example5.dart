void main(List<String> args) {
  final vehicle = VehicleType.car;
  switch (vehicle) {
    case VehicleType.car:
    case VehicleType.bicycle:
    case VehicleType.motorcycle:
      print('Most common personal vehicle');
    case VehicleType.truck:
      print('Usually used for work');
  }
}

enum VehicleType {
  car,
  truck,
  motorcycle,
  bicycle,
}
