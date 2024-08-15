import 'package:btvn_buoi11/dart_concurrency/btvn/btvn_stream/view_models/lab1_viewmodel.dart';
import 'package:flutter/material.dart';

import '../models/lab1_model.dart';

class Lab1View extends StatefulWidget {
  const Lab1View({super.key});

  @override
  State<Lab1View> createState() => _Lab1ViewState();
}

class _Lab1ViewState extends State<Lab1View> {
  final _viewModel= Lab1ViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewModel.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder(
                stream: _viewModel.streamController.stream,
                initialData: 1,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == 12) {
                      _viewModel.streamController.close();
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
