void main(List<String> args) {
  final op = operation("/");
  print(op(1, 0));
  print(operation("-")(5, 2));
}

num Function(num, num) operation(String op) {
  switch (op) {
    case '+':
      return (num a, num b) => a + b;
    case '-':
      return (num a, num b) => a - b;
    case '*':
      return (num a, num b) => a * b;
    case '/':
      return (num a, num b) {
        try {
          return a / b;
        } catch (e) {
          print("can't divide by 0");
          return -1;
        }
      };
    default:
      return (num a, num b) => a + b;
  }
}
