
import 'dart:ui';

import 'package:btvn_buoi11/app_phone/model/thing_bought.dart';
import 'package:btvn_buoi11/app_phone/service/save_login.dart';
import 'package:btvn_buoi11/app_phone/utils/firebase/storage/firebase_storage.dart';
import 'package:get/get.dart';

class ThingBoughtController extends GetxController{
  List<ThingBought> dsThingBought=<ThingBought>[].obs;
  RxBool isLoading=false.obs;
  RxBool isCheckDarkMode=false.obs;
  final FirebaseStorage firebaseStorage=FirebaseStorage();
  final SaveLogin saveLogin=SaveLogin();
  Locale valueLocale=Locale('vi','VI');

  Future<void> addItemThingBought({required thingName, required cost}) async{
    isLoading.value=true;
    bool resultAdd=await firebaseStorage.addThingsBought(nameThing: thingName, money: cost);
    if(resultAdd){
      Get.snackbar('Thành công', 'Thêm thành công');
      //dsThingBought.add(ThingBought(null, cost, thingName));
      await getDSThingBought();
    }else{
      Get.snackbar('ERROR', 'Lỗi add');
    }
    isLoading.value=false;
  }

  Future<void> getDSThingBought() async{
    isLoading.value=true;
    List<ThingBought> response=await firebaseStorage.getThingsBought();
    if(response.isEmpty){
      Get.snackbar('ERROR', 'Lôix');
    }else{
      dsThingBought.clear();
      dsThingBought.addAll(response);
    //  print(dsThingBought.length);
    }
    isLoading.value=false;
  }

  Future<void> updateItemThingBought(String idItemUpdate,Map<String,dynamic> dataUpdate)async{
    isLoading.value=true;
    bool resultUpdate=await firebaseStorage.updateThingsBought(idItemUpdate,dataUpdate);
    if(resultUpdate==true){
      Get.snackbar('Success', 'Cập nhật thành công');
      await getDSThingBought();
    }else{
      Get.snackbar('ERROR', 'Cập nhật thất bại');
    }
    isLoading.value=false;
  }

  Future<void> deleteItemThingBought(String idItemDelete) async{
    isLoading.value=true;
    bool resultDelete=await firebaseStorage.deleteThingsBought(idItemDelete);
    if(resultDelete){
      Get.snackbar('Success', 'Xóa thành công');
      await getDSThingBought();
    }else{
      Get.snackbar('ERORR', 'Xóa thất bại');
    }
    isLoading.value=false;
  }

  final List<Map<String,dynamic>> localizations=[
    {
      "name":"Italia",
      "Local": const Locale('it','IT'),
    },
    {
      "name":"VietNam",
      "Local":const Locale('vi','VI')
    },
  ];

  ///Cách 1

  Future<void> saveLanguage(Locale locale)async{
    await saveLogin.saveStringData('languageValue', locale.languageCode);
    await saveLogin.saveStringData('localValue', locale.countryCode ?? '');
  }

  Future<void> readLanguage()async{
    String? valueLanguage=await saveLogin.readStringData('languageValue');
    String? valueLocal=await saveLogin.readStringData('localValue');
    valueLocale=Locale(valueLanguage,valueLocal);
  }

  ///Cách 2

  // Future<void> saveLanguage(Locale locale)async{
  //   await saveLogin.saveListStringData('languageValue', [locale.languageCode,locale.countryCode ?? ""]);
  // }
  //
  // Future<void> readLanguage()async{
  //   List<String> result=await saveLogin.readListStringData('languageValue');
  //   String? valueLanguage= result[0];
  //   String? valueLocal=result[1];
  //   valueLocale=Locale(valueLanguage,valueLocal);
  // }


  Future<void> saveTheme(bool value)async{
    await saveLogin.saveBoolCheck('Theme', value);
  }

  Future<void> readTheme() async{
   isCheckDarkMode.value=await saveLogin.readBoolCheck('Theme');
   print('Gía trị value Theme : $isCheckDarkMode');
  }
  void changeIsCheckDarkMode(){
    isCheckDarkMode.value=!isCheckDarkMode.value;
  }
  // Future<List<String>> readLanguage()async{
  //  return await saveLogin.readListStringData('items');
  // }


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await readLanguage();
   // await readTheme();
  }
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    await getDSThingBought();

  }
}
