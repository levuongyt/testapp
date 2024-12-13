import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/phones_model.dart';

class PhonesController extends GetxController {
  Rx<PhonesModel> detailsPhone = PhonesModel().obs;
  RxString titleColor = ''.obs;
  RxString titleRom = ''.obs;
  // RxString moTaSP=''.obs;
  String name = '';
  List<String> dsImage = [];
  List<String> chiTiet = [];
  List<String> gia = [];
  List<String> gia1 = [];
  List<double> gia2 = [];
  RxInt viTriImage = 0.obs;

  RxBool isLoading = false.obs;
  List<Map<String, String>> listChiTietSp = [];

  final Dio dio = Dio();

  // Future<PhonesModel > fetchAlbum() async {
  Future<void> fetchAlbum() async {
    isLoading.value = true;
    String urlApi =
        'https://discovery.tekoapis.com/api/v1/product?productld=535038&sku=230900684&location=&terminalCode=phongvu';
    try {
      ///Get
      // final response = await http.get(Uri.parse(urlApi));

      final response = await dio.get(urlApi);
      if (response.statusCode == 200) {
        ///Get
        // detailsPhone.value = PhonesModel.fromJson(
        //     jsonDecode(response.body) as Map<String, dynamic>);

        detailsPhone.value =
            PhonesModel.fromJson(response.data as Map<String, dynamic>);
        isLoading.value = false;

        // getMoTaSP();
      } else {
        isLoading.value = false;
        Get.snackbar('Lỗi Load1', 'ABC11');
      }
    } catch (error) {
      isLoading.value = false;
      Get.snackbar('Lỗi Load', 'ABC');
    }
  }

  void getImage() {
    dsImage = detailsPhone.value.result?.product?.productDetail?.images
            ?.map((e) => e.url ?? '')
            .toList() ??
        [];
  }

  void getViTriImage(int viTri) {
    viTriImage.value = viTri;
  }

  List<String?> getColor() {
    List<String?> colorSelecteds = detailsPhone
            .value.result?.product?.productOptions?.rows?[1].options
            ?.map((e) => e.label)
            .toList() ??
        [];
    return colorSelecteds;
  }

  void chonColor(String color) {
    titleColor.value = color;
  }

  List<String?> getSizeRom() {
    List<String?> sizeRom = detailsPhone
            .value.result?.product?.productOptions?.rows?[0].options
            ?.map((e) => e.label)
            .toList() ??
        [];
    // if(sizeRom.isNotEmpty) {
    //   print('123 dada ${sizeRom.first}');
    // }
    return sizeRom;
  }

  void chonSizeRom(String dungLuong) {
    titleRom.value = dungLuong;
  }

  void getName() {
    name = detailsPhone.value.result?.product?.productInfo?.name ?? '';
  }

  void getGia() {
    gia = detailsPhone.value.result?.product?.prices
            ?.map((e) => e.maxLatestPrice ?? '')
            .toList() ??
        [];
    gia1 = detailsPhone.value.result?.product?.prices
            ?.map((e) => e.supplierRetailPrice ?? '')
            .toList() ??
        [];
    gia2 = detailsPhone.value.result?.product?.prices
            ?.map((e) => e.discountPercent ?? 0.0)
            .toList() ??
        [0.0];
  }

  void getThongTinMay() {
    chiTiet = detailsPhone
            .value.result?.product?.productDetail?.shortDescription
            ?.split('<br/>') ??
        [];
  }

  void getChiTietSP() {
    final dsChiTietSP =
        detailsPhone.value.result?.product?.productDetail?.attributeGroups;
    List<Map<String, String>> dsCT = [];
    if (dsChiTietSP != null && dsChiTietSP.isNotEmpty) {
      for (var item in dsChiTietSP) {
        dsCT.add({'name': item.name ?? '', 'value': item.value ?? ''});
      }
      listChiTietSp.assignAll(dsCT);
    }
  }

  String motaSP = '';
  void getMoTaSP() {
    motaSP =
        detailsPhone.value.result?.product?.productDetail?.description ?? '';
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchAlbum();
    getImage();
    getName();
    getColor();
    getGia();
    getThongTinMay();
    getChiTietSP();
    getSizeRom();
  }

  @override
  String toString() {
    return 'PhonesController{}';
  }
}
