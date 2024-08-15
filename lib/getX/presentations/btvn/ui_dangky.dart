import 'package:btvn_buoi11/getX/presentations/btvn/bt_dangky_controller.dart';
import 'package:btvn_buoi11/getX/presentations/btvn/ui_dangnhap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DangKyController dangKyController=Get.put(DangKyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('ĐĂNG KÝ',style: TextStyle(color:Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: dangKyController.formKey,
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: dangKyController.usernameController,
                      validator: dangKyController.ktUserName,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: dangKyController.passwordController,
                      validator: dangKyController.ktPassWord,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: dangKyController.confirmPasswordController,
                      validator: dangKyController.ktNhapLaiPass,
                      decoration: InputDecoration(
                          hintText: 'Nhập lại Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: dangKyController.nameController,
                      validator: dangKyController.ktRong,
                      decoration: InputDecoration(
                          hintText: 'Họ và tên',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: dangKyController.addressController,
                      validator: dangKyController.ktRong,
                      decoration: InputDecoration(
                          hintText: 'Địa chỉ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: dangKyController.addressController,
                      validator: dangKyController.ktRong,
                      decoration: InputDecoration(
                          hintText: 'Giới tính',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent),
                            onPressed: () {
                              if(dangKyController.formKey.currentState!.validate()){
                                Get.to(const DangNhap());
                              }
                            },
                            child: const Text(
                              'ĐĂNG KÝ',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
