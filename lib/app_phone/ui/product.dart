import 'package:btvn_buoi11/app_phone/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductUI extends StatefulWidget {
  const ProductUI({super.key});

  @override
  State<ProductUI> createState() => _ProductUIState();
}

class _ProductUIState extends State<ProductUI> {
  final ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRODUCT',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.white))
            ],
          )
        ],
      ),
      body: SafeArea(child: Obx(() {
        if (controller.loadAll.value == true) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return NotificationListener<ScrollNotification>(
              onNotification: (scroll) {
                if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
                  if (scroll is ScrollEndNotification) {
                    controller.loadMore();
                  }
                }
                return true;
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.dsProduct.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                color: Colors.grey,
                                child: Text(
                                    controller.dsProduct[index].title ?? ''),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Obx(() => controller.loadList.value == true
                        ? const CircularProgressIndicator()
                        : const SizedBox()
                    )
                  ],
                ),
              )
          );
        }
      }
      )
      ),
    );
  }
}
