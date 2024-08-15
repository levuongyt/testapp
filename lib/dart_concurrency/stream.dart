import 'dart:async';
void main(){
  // Stream stream=Stream.periodic(const Duration(seconds: i),(i){
  //
  // });
  StreamController streamController=StreamController();
  StreamSubscription streamSubscription=streamController.stream.listen((event) {
    print('Stream onListen: $event');
  });
  streamController.sink.add('event');
  streamController.sink.add('even1');
  streamController.add('1111');
  streamController.add('2222');
}