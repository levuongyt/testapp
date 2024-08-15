import 'package:get/get.dart';

class GetxControllerDeMo extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }

  void decrease() {
    count--;
  }

  String result = 'Show';
  void doiText() {
    if (result == 'Show') {
      result = 'Hello';
    } else if (result == 'Hello') {
      result = 'Show';
    }
    update();
  }
}
