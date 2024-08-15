import 'package:btvn_buoi11/dart_concurrency/btvn/btvn_stream/view_models/lab4_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../lab_4.dart';

class Lab4View extends StatefulWidget {
  const Lab4View({super.key});

  @override
  State<Lab4View> createState() => _Lab4ViewState();
}

class _Lab4ViewState extends State<Lab4View> {
  final _viewModel=Lab4ViewModel();
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
                  value: _viewModel.currentValue.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _viewModel.currentValue = value.toInt();
                    });
                    int kq = _viewModel.giaiThua(value.toInt());
                    _viewModel.addStream(kq);
                  }),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: _viewModel.streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text('Giai thua cua ${_viewModel.currentValue} '),
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
                            builder: (context) => HistoryView(history: _viewModel.history)));
                  },
                  child: const Text('Lich su')),
            ],
          ),
        ),
      ),
    );
  }
}
