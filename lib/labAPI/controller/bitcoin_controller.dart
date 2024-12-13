import 'dart:convert';

import 'package:btvn_buoi11/labAPI/models/bitcoin_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BitCoinController extends GetxController {
  Rx<BitCoinModels> detailBicoin = BitCoinModels().obs;
  RxString timeUpdate = ''.obs;
  RxString timeUpdateIso = ''.obs;
  RxString timeUpdateDuck = ''.obs;
  RxString apiData=''.obs;
  final Dio dio = Dio();
  Future<void> getDaTa() async {
    String apiUrl = 'https://api.coindesk.com/v1/bpi/currentprice.json';
    final response = await dio.get(apiUrl);
    print('123: ${response.data}');
    if (response.statusCode == 200) {
      detailBicoin.value =
          BitCoinModels.fromJson(response.data as Map<String, dynamic>);
     // apiData.value=jsonEncode(response.data);
      getTime();
      print('${response.data}');
    } else {
      Get.snackbar('Looix', 'ACSCS');
    }
  }

  void getTime() {
    final timeDaTa = detailBicoin.value?.time;
    timeUpdate.value = timeDaTa?.updated ?? '';
    timeUpdateIso.value = timeDaTa?.updatedISO ?? '';
    timeUpdateDuck.value = timeDaTa?.updateduk ?? '';
  }
  @override
  Future<void> onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getDaTa();
    getTime();
  }


  @override
  String toString() {
    return 'BitCoinController{}';
  }
}
