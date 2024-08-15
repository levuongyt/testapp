import 'package:btvn_buoi11/dart_concurrency/btvn/btvn_stream/view_models/lab3_viewmodel.dart';
import 'package:flutter/material.dart';

class Lab3View extends StatefulWidget {
  const Lab3View({super.key});

  @override
  State<Lab3View> createState() => _Lab3ViewState();
}

class _Lab3ViewState extends State<Lab3View> {
  final _viewModel=Lab3ViewModel();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewModel.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
                stream: _viewModel.lab3Controller.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                     // _viewModel.timeInput(snapshot.data ?? 0),
                     snapshot.data ?? '0s'
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
