import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding_controller.dart';

class GetUIBinding extends StatelessWidget {
  const GetUIBinding({super.key});

  @override
  Widget build(BuildContext context) {
    //  final controller=Get.find<DeMoBindingController>();
    return Scaffold(
        body: SafeArea(
            child: Column(
                children: [
       Text('${Get.find<DeMoBindingController>().count}'),
      const SizedBox(
        height: 20,
      ),
      // ElevatedButton(
      //     onPressed: () {
      //       Get.find<DeMoBindingController>().increment();
      //     },
      //     child: const Text('+'))
    ])));
  }
}
