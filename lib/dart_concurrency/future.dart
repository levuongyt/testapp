// void main() async {
//   // print('1');
//   // print(await fetchUserOrder());
//   // print('2');
//   fetchUserOrder().then((value) => print('value : $value')).catchError(() {
//     print('error:');
//   });
// }

// Future<String> fetchUserOrder() async{
//  await Future.delayed(const Duration(seconds: 2));
//   return 'large Latte';
// }
Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'You order is:$order';
}

Future<String> fetchUserOrder() => Future.delayed(
      const Duration(seconds: 2),
      () => throw ('404'),
    );
Future<String> fetchUserOrder2() async {
  return Future.delayed(Duration(seconds: 2), () {
    return '';
  });
}

Future<String> one() => Future.value('From one');
Future<String> two() => Future.error('error two');
//Future<String> two() => Future.value('error two');
//Future<List<String>> two() => Future.error('error two');
Future<String> two2() => Future.value('From two2');
Future<String> three() => Future.value('From three');
Future<String> four() => Future.value('From four');

void main() async {
  // one()
  //     .then((value) => two())
  //     .then((value) => three())
  //     .then((value) => four())
  //     .then((value) => value.length)
  //     .catchError((e) {
  //   print('Got error:$e');
  //   return 44;
  // }).then((value) {
  //   print('The value is $value');
  // }).whenComplete(() => print('something clear'));

  // Future.delayed(Duration(seconds: 1), () => throw 401)
  //     .then(
  //       (value) {
  //         throw 'Unreachable';
  //       },
  //       onError: (error) {
  //         print('OnError');
  //       },
  //     )
  //     .then((value) => 1)
  //     .catchError((err) {
  //       print('Dich vu khong hoat dong');
  //     });

  /// ForEach Future
  Future delayed(int second) async{
    await Future.delayed(Duration(seconds: second));
    return second;
  }
  List<int> steps=[1,2,3,4,5];

//   var result= await Future.forEach<int>(steps, (step) {
//     print('current step: $step');
//     return delayed(step);
//   });
// }

var  result = await delayed(3).timeout(Duration(seconds: 2)).catchError((err){
  return err.toString();
  });
print(result);
}
