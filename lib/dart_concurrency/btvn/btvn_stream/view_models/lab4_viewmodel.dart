import 'dart:async';

class Lab4ViewModel{
  final StreamController<int> streamController =
  StreamController<int>.broadcast();
  List<int> history = [];
  int currentValue = 1;
  int giaiThua(int n) {
    int result = 1;
    if (n == 0 || n == 1) {
      return 1;
    }
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }

  void addStream(int value) {
    if (!history.contains(value)) {
      streamController.add(value);
      history.add(value);
    }
  }

}