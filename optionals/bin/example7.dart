void main(List<String> args) {
  try {
    final String? firstName = null;
    print(firstName ?? 'No name found');
  } catch (error) {
    print(error);
  }
}
