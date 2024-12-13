import 'package:btvn_buoi11/app_phone/controller/thing_bought_controller.dart';
import 'package:btvn_buoi11/app_phone/model/theme_app_model.dart';
import 'package:btvn_buoi11/resources/image_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class DemoFirestore extends StatefulWidget {
  const DemoFirestore({super.key});

  @override
  State<DemoFirestore> createState() => _DemoFirestoreState();
}

class _DemoFirestoreState extends State<DemoFirestore> {
  final ThingBoughtController controller = Get.find();
  final TextEditingController costController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  void resetText() {
    costController.clear();
    titleController.clear();
  }

  void showDialog(String title, Function xuLi) {
    Get.dialog(AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: costController,
            decoration: const InputDecoration(hintText: 'Cost'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
            onPressed: () async {
              Get.back();
              await xuLi();
              resetText();
            },
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white),
            ))
      ],
    ));
  }

  void showDeleteDialog(String idXoa) {
    Get.dialog(AlertDialog(
      title: const Text('Xác nhận xóa'),
      content: const Text('Bạn có chắc chắn muốn xóa không ?'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Không')),
        TextButton(
            onPressed: () async {
              Get.back();
              await controller.deleteItemThingBought(idXoa);
            },
            child: const Text('Có')),
      ],
    ));
  }

  void showChangeLanguage(){
    Get.dialog(
        AlertDialog(
      title: Text('Đổi ngôn ngữ'),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.localizations.length,
          itemBuilder: (BuildContext context, int index) {
            final currentLanguageValue=controller.localizations[index]['name'];
            final currentLocalValue=controller.localizations[index]['Local'];
            return InkWell(
                onTap: () async{
                  Get.back();
                  print('test: ${currentLocalValue}');
                 await controller.saveLanguage(currentLocalValue);
                  Get.updateLocale(currentLocalValue);
                },
                child: Text(currentLanguageValue,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
            );
          },
        ),
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    ever(controller.isLoading, (callback) {
      print("Loading state: ${controller.isLoading}");

      if (callback) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
    return Scaffold(
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
          onPressed: () {
            resetText();
            showDialog('Add', () async {
              await controller.addItemThingBought(
                  thingName: titleController.text, cost: costController.text);
            });
          },
          child: const Text(
            'Add thing bought',
            style: TextStyle(color: Colors.white),
          )),
      appBar: AppBar(
        title: const Text(
          'Things Bought',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {
               showChangeLanguage();
              },
              icon: Icon(Icons.language)),
          IconButton(
              onPressed: () async {
                controller.changeIsCheckDarkMode();
                print('check la: ${controller.isCheckDarkMode}');
             //   Get.changeTheme(Get.isDarkMode ? ThemesApp.light : ThemesApp.dark);
                Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);

              //  Get.changeThemeMode(controller.isCheckDarkMode.value? ThemeMode.light : ThemeMode.dark);
                await controller.saveTheme(controller.isCheckDarkMode.value);
              },
              icon: Icon(Icons.invert_colors_on))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text('hello'.tr),
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.dsThingBought.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.asset(
                              ImageApp.imageMoney,
                              height: 50,
                              width: 50,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.dsThingBought[index].title ??
                                      ''),
                                  Text(controller.dsThingBought[index].cost ??
                                      ''),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  costController.text =
                                      controller.dsThingBought[index].cost ??
                                          '';
                                  titleController.text =
                                      controller.dsThingBought[index].title ??
                                          '';
                                  showDialog('Edit', () async {
                                    await controller.updateItemThingBought(
                                        controller.dsThingBought[index].id ??
                                            '',
                                        {
                                          'thingName': titleController.text,
                                          'cost': costController.text
                                        });
                                  });
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  showDeleteDialog(
                                      controller.dsThingBought[index].id ?? '');
                                },
                                icon: const Icon(Icons.close)),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
