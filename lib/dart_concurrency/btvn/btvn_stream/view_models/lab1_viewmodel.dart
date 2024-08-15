import 'dart:async';
import 'package:btvn_buoi11/dart_concurrency/btvn/btvn_stream/models/lab1_model.dart';

class Lab1ViewModel{
 final Lab1Model _model = Lab1Model();
  final streamController = StreamController<int>();
  void demTime() {
    Stream.periodic(const Duration(seconds: 5), (i) => i + 1).listen((value) {
      streamController.add(value);
      // if(value == 12){
      //    streamController.onPause;
      //   }
    });
  }
  void initState(){
    streamController.add(_model.count);
    demTime();
  }

  void dispose(){
    streamController.close();
  }
}