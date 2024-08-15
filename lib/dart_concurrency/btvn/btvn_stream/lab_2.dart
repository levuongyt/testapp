import 'dart:async';

import 'package:flutter/material.dart';

class Lab2 extends StatefulWidget {
  const Lab2({super.key});

  @override
  State<Lab2> createState() => _Lab2State();
}

class _Lab2State extends State<Lab2> {
  final textController = StreamController();
  final buttonController = StreamController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonController.add(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    buttonController.close();
    textController.close();
  }

  Future<void> demNguoc() async {
    buttonController.add(false);
    for (int i = 3; i >= 0; i--) {
      textController.add(i);
      await Future.delayed(const Duration(seconds: 1));
    }
    buttonController.add(true);
    textController.add(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: textController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data > 0) {
                      return Text('After ${snapshot.data}');
                    } else {
                      return const Text('Done');
                    }
                  }
                  return Container();
                }),
            StreamBuilder(
                stream: buttonController.stream,
                builder: (context, snapshot) {
                  bool checkButton = snapshot.data ?? true;
                  return ElevatedButton(
                      onPressed: checkButton ? demNguoc : null,
                      child: const Text("CLICK"));
                })
          ],
        ),
      ),
    );
  }
}
