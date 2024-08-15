import 'dart:async';

import 'package:btvn_buoi11/dart_concurrency/btvn/btvn_stream/models/lab3_model.dart';

class Lab3ViewModel{
  final _model=Lab3Model(0);
  final lab3Controller=StreamController();
  Lab3ViewModel(){
    startTime();
  }
  void startTime(){
    Stream.periodic(const Duration(seconds: 1),(dem) => dem).listen((seconds) {
      _model.seconds=seconds;
      lab3Controller.add(timeInput(seconds));
    });
  }
  String timeInput(int seconds) {
    int phut = seconds ~/ 60;
    int giay = seconds % 60;
    if (phut == 0) {
      return '$giay s';
    } else {
      return '${phut}p${giay}s';
    }
  }
  void dispose(){
    lab3Controller.close();
  }
}