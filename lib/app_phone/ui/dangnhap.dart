import 'package:btvn_buoi11/app_phone/controller/login_cntroller.dart';
import 'package:btvn_buoi11/app_phone/ql_firebase.dart';
import 'package:btvn_buoi11/app_phone/ui/phone_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DangNhap123 extends StatefulWidget {
  const DangNhap123({super.key});

  @override
  State<DangNhap123> createState() => _DangNhap123State();
}

class _DangNhap123State extends State<DangNhap123> {
  final QLFireBase qlFireBase = QLFireBase();
  final LoginController controller=LoginController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
controller.onInit() ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LOGIN'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Obx(
            () => qlFireBase.isLoading.value == true
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                              hintText: 'email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                              hintText: 'password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Checkbox(
                            value: controller.isCheck.value,
                            onChanged: (_) async{
                             controller.isChecbook();
                             // await controller.writePassWordLcal(isCheck);
                              //await controller.readPassWordLcal();

                              // await controller.ktIsCheck(controller.isCheck.value);
                            // await controller.writeDataString('dataEmail', controller.emailController.text);
                           //  await controller.writeDataString('dataPass', controller.passwordController.text);

                              await controller.saveLoginData();
                              //await controller.readCheckBook();
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await qlFireBase.login(controller.emailController.text,
                                         controller.passwordController.text) ==
                                      true
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'thanh cong!')))
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                          'Sai email hoặc mật khẩu!')));
                              await qlFireBase.login(controller.emailController.text,
                                  controller.passwordController.text) ==
                                      true
                                  ? Get.to(const PhonesUI())
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Sai email hoặc mật khẩu!')));
                            },
                            child: const Text('DANG NHAP')),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await qlFireBase.signInWithFacebook() == true
                                  ? Get.to(const PhonesUI())
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('DANG NHAP THAT BAI')));
                            },
                            child: const Text('DANG NHAP BANG FACEBOOK')),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              qlFireBase.signInWithGoogle();
                            },
                            child: Text('ĐĂNG NHẬP BẰNG GOOGLE')),

                        // ElevatedButton(onPressed: (){}, child: Text('DANG KY'))
                      ],
                    ),
                  ),
          ),
        ));
  }
}
