import 'package:flutter/material.dart';

class Lab3 extends StatefulWidget {
  const Lab3({super.key});

  @override
  State<Lab3> createState() => _Lab3State();
}

class _Lab3State extends State<Lab3> {
  final Stream<int> demTime =
      Stream.periodic(const Duration(seconds: 1), (dem) => dem);
  String timeInput(int seconds) {
    int phut = seconds ~/ 60;
    int giay = seconds % 60;
    if (phut == 0) {
      return '$giay s';
    } else {
      return '${phut}p${giay}s';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
                stream: demTime,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      timeInput(snapshot.data ?? 0),
                    );
                  } else {
                    return const Text('0s');
                  }
                })
          ],
        ),
      ),
    );
  }
}
