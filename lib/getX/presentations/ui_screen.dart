import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_x_demo_controller.dart';

class GetXUI extends GetView<GetxControllerDeMo> {
  const GetXUI({super.key});

  @override
  Widget build(BuildContext context) {
    final GetxControllerDeMo controller = Get.put(GetxControllerDeMo());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => Text('${controller.count}')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: const Text('+')),
            ElevatedButton(
                onPressed: () {
                  controller.decrease();
                },
                child: const Text('-')),
            const SizedBox(height: 20,),
            GetBuilder<GetxControllerDeMo>(builder: (_){
              return Text(controller.result);
            }),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              controller.doiText();
            }, child: const Text('Chuyen'))
          ],
        ),
      ),
    );
  }
}
