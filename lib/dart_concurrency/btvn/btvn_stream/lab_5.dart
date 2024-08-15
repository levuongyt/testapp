import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Lab5 extends StatefulWidget {
  const Lab5({super.key});

  @override
  State<Lab5> createState() => _Lab5State();
}

class _Lab5State extends State<Lab5> {
  late List<StreamController<double>> dsStreamController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dsStreamController = List.generate(10, (_) => StreamController<double>());
  }
  @override
  void dispose() {
    // TODO: implement dispose
     for (var controller in dsStreamController) {
      controller.close();
     }
    super.dispose();
  }

  Future<void> downFile(int index) async {
    final random = Random();
    final timeRanDom = Duration(seconds: random.nextInt(6) + 10);
    final time = timeRanDom.inSeconds;

    for (int i = 0; i <= time; i++) {
      await Future.delayed(const Duration(seconds: 1));
      double tienDo = (i / time) * 100;
      dsStreamController[index].add(tienDo);
    }
  }

  void startDownload() {
    for (int i = 0; i < 10; i++) {
      dsStreamController[i].add(0.0);
      downFile(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Down File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: startDownload,
                child: const Text('Download')
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<double>(
                      initialData: 0.0,
                        stream: dsStreamController[index].stream,
                        builder: (context, snapshot){
                       double tienDo= snapshot.data ?? 0.0;
                       return Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('File ${index+1}'),
                           LinearProgressIndicator(
                             value: tienDo/100,
                           ),
                           Text('${tienDo.toStringAsFixed(1)}%')
                         ],
                       );
                        },
                        ),
                  );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
