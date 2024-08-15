import 'package:btvn_buoi11/getX/binding/binding_controller.dart';
import 'package:get/get.dart';

class MyBinding implements Bindings{
  @override
  void dependencies() {
    //Get.put(()=> DeMoBindingController());
    Get.put(DeMoBindingController());
  }
}