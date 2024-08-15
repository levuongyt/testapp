import 'package:flutter/material.dart';

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
