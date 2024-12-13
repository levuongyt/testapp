import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/save_login.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isCheck = false.obs;
  final SaveLogin saveLogin = SaveLogin();

  void isChecbook() {
    isCheck.value = !isCheck.value;
  }

  Future<void> saveLoginData() async {
    if (isCheck.value == true) {
      await saveLogin.saveStringData('dataEmail', emailController.text);
      await saveLogin.saveStringData('dataPass', passwordController.text);
    }
    await saveLogin.saveBoolCheck('checkbook',isCheck.value);
  }

  Future<void> loadLoginData() async {
    isCheck.value = await saveLogin.readBoolCheck('checkbook');
    if (isCheck.value) {
      emailController.text = await saveLogin.readStringData('dataEmail');
      passwordController.text = await saveLogin.readStringData('dataPass');
    }
  }

  // Future<void> ktIsCheck(bool check) async {
  //   bool resultWrite = await prefSerVice.saveBoolCheck(check);
  //   if (resultWrite) {
  //    // Get.snackbar('Success', 'Thanhf cong');
  //     print('trang thai: ${isCheck.value}');
  //   }
  //   else {
  //     //Get.snackbar('error', 'That bai');
  //   }
  // }
  //
  // Future<void> readCheckBook() async {
  //   bool? resultWrite = await prefSerVice.readBoolCheck();
  //   if (resultWrite != false) {
  //     isCheck.value = resultWrite;
  //     // Get.snackbar('Success', 'Thanhf cong');
  //     await readDataString();
  //     print('Luu : ${isCheck.value}');
  //   }
  //   else {
  //    // Get.snackbar('error', 'That bai');
  //   }
  // }
  //   Future<void> writeDataString(String key,String passSave) async {
  //     bool resultWrite = await prefSerVice.saveStringData(key, passSave);
  //     if (resultWrite) {
  //       Get.snackbar('Success', 'Thanhf cong');
  //     }
  //     else {
  //       Get.snackbar('error', 'That bai');
  //     }
  //   }
  //
  //   Future<void> readDataString() async {
  //     emailController.text = await prefSerVice.readStringData('dataEmail');
  //     passwordController.text =await prefSerVice.readStringData('dataPass');
  //      // if (resultWritePass != "") {
  //      //   //Get.snackbar('Success', 'Thanhf cong');
  //      //   passwordController.text = resultWritePass;
  //      //   emailController.text=
  //      // }
  //      // else {
  //      //  // Get.snackbar('error', 'That bai');
  //      // }
  //   }
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    // await readCheckBook();
    await loadLoginData();
    // await readPassWordLcal();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
