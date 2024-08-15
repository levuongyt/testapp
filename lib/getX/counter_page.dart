import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class CounterPageGetX extends StatelessWidget {
  const CounterPageGetX({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
              '${counterController.count}',
              //style: Theme.of(context).textTheme.headline4,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterController.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
