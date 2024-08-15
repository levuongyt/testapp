import 'dart:async';

import 'package:flutter/material.dart';

class Lab1 extends StatefulWidget {
  const Lab1({super.key});

  @override
  State<Lab1> createState() => _Lab1State();
}

class _Lab1State extends State<Lab1> {
  final streamController = StreamController<int>();
  int count = 1;
  void demTime() {
    Stream.periodic(const Duration(seconds: 5), (i) => i + 1).listen((value) {
      streamController.add(value);
      // if(value == 12){
      //    streamController.onPause;
      //   }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamController.add(count);
    demTime();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
                stream: streamController.stream,
                initialData: 1,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == 12) {
                      streamController.close();
                    }
                    return Text("${snapshot.data}");
                  } else {
                    return const Text('Đang khởi tạo');
                  }
                })
          ],
        ),
      ),
    );
  }
}
