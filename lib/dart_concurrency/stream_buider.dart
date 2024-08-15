import 'dart:async';

import 'package:flutter/material.dart';

class DeMoStreamBuilder extends StatefulWidget {
  const DeMoStreamBuilder({super.key});

  @override
  State<DeMoStreamBuilder> createState() => _DeMoStreamBuilderState();
}

class _DeMoStreamBuilderState extends State<DeMoStreamBuilder> {
  final Stream s = Stream.periodic(const Duration(seconds: 2), (i) => i);
  //final String name= 'Vuong';
  final streamController = StreamController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          children: [
          StreamBuilder(stream: streamController.stream, builder: (BuildContext _, AsyncSnapshot<dynamic> snapshot){
            return Text(snapshot.data ?? 'Hello');
        },),
            ElevatedButton(
                onPressed: (){
              streamController.add('Lê Minh Vương');
            }, child: Text('ABC'))
          ],
        )
    )
    )
        // StreamBuilder(
        //   stream: s,
        //   builder: (BuildContext _, AsyncSnapshot<dynamic> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Text("Loading, please wait...");
        //     }
        //     if (snapshot.hasData) {
        //       return Text("After ${snapshot.data}s");
        //     }
        //     return Text(snapshot.toString());
        //   },
        // ),
      );
   // ));
  }
}
