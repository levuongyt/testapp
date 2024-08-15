import 'dart:async';
import 'dart:math';

class Lab5ViewModel{
  final List<StreamController<double>> dsStreamController = List.generate(10, (_) => StreamController<double>());

  Future<void> downFile(int index) async {
  final random = Random();
  final timeRanDom = Duration(seconds: random.nextInt(6) + 10);
  final time = timeRanDom.inSeconds;

  for (int i = 0; i <= time; i++) {
  await Future.delayed(const Duration(seconds: 1));
  double tienDo = (i / time) * 100;
  dsStreamController[index].add(tienDo);
  }
  }

  void startDownload() {
  for (int i = 0; i < 10; i++) {
  dsStreamController[i].add(0.0);
  downFile(i);
  }
  }
  void dispose(){
  for (var controller in dsStreamController) {
  controller.close();
  }
  }
}