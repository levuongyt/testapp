import 'package:btvn_buoi11/app_phone/controller/phones_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhonesUI extends StatefulWidget {
  const PhonesUI({super.key});

  @override
  State<PhonesUI> createState() => _PhonesUIState();
}

class _PhonesUIState extends State<PhonesUI> {
  final PhonesController controller = Get.put(PhonesController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
            ),
            onPressed: () {},
            child: const Center(
                child: Text(
              'Liên hệ',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_horiz)),
              ],
            ),
          ],
        ),
        body: SafeArea(
          child: Obx(
            () => controller.isLoading.value == true
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CarouselSlider(
                                items: controller.dsImage
                                    .map((item) => Image.network(
                                          item,
                                          fit: BoxFit.fill,
                                          height: 350,
                                          width: double.infinity,
                                        ))
                                    .toList(),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayAnimationDuration:
                                      const Duration(seconds: 5),
                                  onPageChanged: (index, _) {
                                    controller.getViTriImage(index);
                                  },
                                ),
                              ),
                              Positioned(
                                right: 10,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                        '${controller.viTriImage.value + 1}/${controller.dsImage.length}')),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text('MÀU SẮC'),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(controller.titleColor.value),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          (controller.getColor().isNotEmpty)
                              ? Wrap(
                                  children: controller
                                      .getColor()
                                      .map((e) => buildColor(e ?? ''))
                                      .toList(),
                                )
                              : Container(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            const Text('Dung lượng (ROM): '),
                            Text(controller.titleRom.value),
                          ]),
                          const SizedBox(
                            height: 10,
                          ),
                          (controller.getSizeRom().isNotEmpty)
                              ? Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: controller
                                      .getSizeRom()
                                      .map((e) => buildDLRom(e ?? ''))
                                      .toList(),
                                )
                              : Container(),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          controller.gia.isNotEmpty
                              ? Text(
                                  '${controller.gia.first}đ',
                                  style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )
                              : Container(),
                          controller.gia1.isNotEmpty
                              ? Row(
                                  children: [
                                    Text(
                                      '${controller.gia1.first}đ',
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '-${controller.gia2.first}%',
                                      style: const TextStyle(
                                          color: Colors.blueAccent),
                                    ),
                                  ],
                                )
                              : Container(),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.chiTiet.length,
                              itemBuilder: (context, index) {
                                return Text(controller.chiTiet[index]);
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Chi tiết sản phẩm',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.listChiTietSp.length,
                              itemBuilder: (context, index) {
                                final item = controller.listChiTietSp[index];
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  color: (index % 2 == 0)
                                      ? Colors.white
                                      : Colors.grey[200],
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text('${item['name']}')),
                                      Expanded(
                                          flex: 3,
                                          child: Text('${item['value']}'))
                                    ],
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Mô tả sản phẩm',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 140,
                          ),
                          // Html(
                          //   data: controller.motaSP),
                          // Html(
                          //     data: controller.moTaSP.value),
                        ],
                      ),
                    ),
                  ),
          ),
        ));
  }

  GestureDetector buildDLRom(String colorRom) {
    return GestureDetector(
      onTap: () {
        controller.chonSizeRom(colorRom);
      },
      child: Obx(() {
        bool chonRom = controller.titleRom.value == colorRom;
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border:
                  Border.all(color: chonRom ? Colors.blueAccent : Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            colorRom,
            style: TextStyle(color: chonRom ? Colors.blueAccent : Colors.black),
          ),
        );
      }),
    );
  }

  GestureDetector buildColor(String colorPhone) {
    return GestureDetector(
      onTap: () {
        controller.chonColor(colorPhone);
      },
      child: Obx(() {
        bool chonMau = controller.titleColor.value == colorPhone;
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 20, bottom: 8),
          decoration: BoxDecoration(
              border:
                  Border.all(color: chonMau ? Colors.blueAccent : Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            colorPhone,
            style: TextStyle(color: chonMau ? Colors.blueAccent : Colors.black),
          ),
        );
      }),
    );
  }
}
