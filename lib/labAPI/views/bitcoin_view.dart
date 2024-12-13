import 'package:btvn_buoi11/labAPI/controller/bitcoin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewBitCoin extends StatefulWidget {
  const ViewBitCoin({super.key});

  @override
  State<ViewBitCoin> createState() => _ViewBitCoinState();
}

class _ViewBitCoinState extends State<ViewBitCoin> {
  final BitCoinController controller = Get.put(BitCoinController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getDaTa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text('${controller.timeUpdate}'),
                Text('${controller.timeUpdateIso}'),
                Text('${controller.timeUpdateDuck}'),
                Text(controller.detailBicoin.value?.disclaimer ??''),
                Text(controller.detailBicoin.value?.chartName??'')
                //Text(controller.apiData.value)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
