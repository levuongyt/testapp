import 'package:btvn_buoi11/app_phone/ui/dangnhap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ql_firebase.dart';

class DANGKY extends StatefulWidget {
  const DANGKY({super.key});

  @override
  State<DANGKY> createState() => _DANGKYState();
}

class _DANGKYState extends State<DANGKY> {
  final QLFireBase qlFireBase = QLFireBase();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DANG KY'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Obx(
        () => qlFireBase.isLoading.value == true
            ? const CircularProgressIndicator()
            : Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (await qlFireBase.register(
                              emailController.text, passwordController.text)) {
                            emailController.clear();
                            passwordController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Đăng ký thành công')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Đăng ký thất bại')));
                          }
                        },
                        child: const Text('DANG KY')),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(const DangNhap123());
                        },
                        child: const Text('DANG   NHAP')),
                    // ElevatedButton(onPressed: (){}, child: Text('DANG KY'))
                  ],
                ),
              ),
      )),
    );
  }
}
