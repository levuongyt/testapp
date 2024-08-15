import 'package:btvn_buoi11/dart_concurrency/btvn/btvn_stream/view_models/lab2_viewmodel.dart';
import 'package:flutter/material.dart';

class Lab2View extends StatefulWidget {
  const Lab2View({super.key});

  @override
  State<Lab2View> createState() => _Lab2ViewState();
}

class _Lab2ViewState extends State<Lab2View> {
  final _viewModel=Lab2ViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.buttonController.add(true);
  }
  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    _viewModel.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                  stream: _viewModel.textController.stream,
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
                  stream: _viewModel.buttonController.stream,
                  builder: (context, snapshot) {
                    bool checkButton = snapshot.data ?? true;
                    return ElevatedButton(
                        onPressed: checkButton ? () => _viewModel.demNguoc() : null,
                        child: const Text("CLICK"));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
