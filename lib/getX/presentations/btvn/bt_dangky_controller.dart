import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DangKyController extends GetxController{
  final formKey=GlobalKey<FormState>();
 final usernameController=TextEditingController();
 final passwordController=TextEditingController();
 final confirmPasswordController=TextEditingController();
 final nameController=TextEditingController();
 final addressController=TextEditingController();
 final gioitinhController=TextEditingController();
 String? ktUserName(String? value){
   if(value == null || value.isEmpty){
    return 'Username Không được bỏ trống';
   }else if(value.length<6){
    return 'Độ dài Username phải từ 6 ký tự trở lên';
   }else if(!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)){
    return 'Username không được chứa ký tự đặc biệt';
   }
   return null;
 }
  String? ktPassWord(String? value){
    if(value == null || value.isEmpty){
      return 'Password Không được bỏ trống';
    }else if(value.length<6){
      return 'Độ dài Password phải từ 6 ký tự trở lên';
    }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$').hasMatch(value)){
      return 'Password chưa đúng định dạng';
    }
    return null;
  }
  String? ktNhapLaiPass(String? value){
    if(value == null || value.isEmpty){
      return 'Password Không được bỏ trống';
    }else if(value != passwordController.text){
      return 'Password không trùng khớp';
    }
    return null;
  }
  String? ktRong(String? value){
   if(value == null|| value.isEmpty){
     return 'Bạn chưa nhập thông tin';
   }
   return null;
  }
}