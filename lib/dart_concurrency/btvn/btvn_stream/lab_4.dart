import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lab4 extends StatefulWidget {
  const Lab4({super.key});

  @override
  State<Lab4> createState() => _Lab4State();
}

class _Lab4State extends State<Lab4> {
  final StreamController<int> _streamController =
      StreamController<int>.broadcast();
  List<int> history = [];
  int currentValue = 1;
  int giaiThua(int n) {
    int result = 1;
    if (n == 0 || n == 1) {
      return 1;
    }
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }

  void addStream(int value) {
    if (!history.contains(value)) {
      _streamController.add(value);
      history.add(value);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoSlider(
                  min: 1,
                  max: 10,
                  value: currentValue.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      currentValue = value.toInt();
                    });
                    int kq = giaiThua(value.toInt());
                    addStream(kq);
                  }),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text('Giai thua cua $currentValue '),
                          subtitle: Text(snapshot.data.toString()),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HistoryView(history: history)));
                  },
                  child: const Text('Lich su')),
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryView extends StatelessWidget {
  final List<int> history;
  const HistoryView({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lich su'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: history.length,
            itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text('giai thua cua ${index + 1}'),
              subtitle: Text(history[index].toString()),
            ),
          );
        }),
      ),
    );
  }
}
