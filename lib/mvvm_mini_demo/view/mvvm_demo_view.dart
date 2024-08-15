import 'package:btvn_buoi11/mvvm_mini_demo/model/mvvm_demo_model.dart';
import 'package:btvn_buoi11/mvvm_mini_demo/view_model/mvvm_demo_view_model.dart';
import 'package:flutter/material.dart';

class DemoMVVMView extends StatefulWidget {
  const DemoMVVMView({super.key});

  @override
  State<DemoMVVMView> createState() => _DemoMVVMViewState();
}

class _DemoMVVMViewState extends State<DemoMVVMView> {
  late MVVMDemoViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = MVVMDemoViewModel();
  }

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
            StreamBuilder<Map<String, dynamic>>(
                stream: _viewModel.humanTotalStream.stream,
                builder: (context, snapshot) {
                  // final List<HumanModel>? data=snapshot.data;
                  final Map<String, dynamic> data = snapshot.data ?? {};
                  // if(data != null){
                  if (data['isLoading']) {
                    return const CircularProgressIndicator();
                    // return Text('Số lượng người hệ thống trả về: ${data.length}');
                  } else {
                    if (data['data'] != null) {
                      final human = data['data'] as List<HumanModel>;
                      return Text('Số lượng người hệ thống trả về: ${human.length}');
                    }else{
                      return const Text('Lỗi ');
                    }
                  }
                }),
            ElevatedButton(
                onPressed: () {
                  _viewModel.getInfoUsers();
                },
                child: const Text('Get Info'))
          ],
        ),
      ),
    );
  }
}
