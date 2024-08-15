import 'package:btvn_buoi11/dart_concurrency/btvn/btvn_stream/view_models/lab5_viewmodel.dart';
import 'package:flutter/material.dart';

class Lab5View extends StatefulWidget {
  const Lab5View({super.key});

  @override
  State<Lab5View> createState() => _Lab5ViewState();
}

class _Lab5ViewState extends State<Lab5View> {
  final _viewModel=Lab5ViewModel();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewModel.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Down File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _viewModel.startDownload,
                child: const Text('Download')
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<double>(
                        initialData: 0.0,
                        stream: _viewModel.dsStreamController[index].stream,
                        builder: (context, snapshot){
                          double tienDo= snapshot.data ?? 0.0;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('File ${index+1}'),
                              LinearProgressIndicator(
                                value: tienDo/100,
                              ),
                              Text('${tienDo.toStringAsFixed(1)}%')
                            ],
                          );
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
