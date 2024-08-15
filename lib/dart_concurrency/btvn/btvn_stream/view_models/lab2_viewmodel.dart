import 'dart:async';

import 'package:btvn_buoi11/dart_concurrency/btvn/btvn_stream/models/lab2_model.dart';

class Lab2ViewModel{
  final _model=Lab2Model();
  final textController = StreamController();
  final buttonController = StreamController();
  Future<void> demNguoc() async {
    buttonController.add(false);
    for (int i = _model.time; i >= 0; i--) {
      textController.add(i);
      await Future.delayed(const Duration(seconds: 1));
    }
    buttonController.add(true);
    textController.add(null);
  }
  void dispose(){
    textController.close();
    buttonController.close();
  }
}