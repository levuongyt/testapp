import 'package:btvn_buoi11/getX/presentations/btvn/ui_dangky.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DangNhap extends StatelessWidget {
  const DangNhap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOGIN',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                      onPressed: () {},
                      child: Text(
                        'ĐĂNG NHẬP',
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                      onPressed: () {
                        Get.to(const SignUpPage());
                      },
                      child: Text(
                        'ĐĂNG KÝ',
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
