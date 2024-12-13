import 'package:btvn_buoi11/app_phone/model/products_response.dart';
import 'package:btvn_buoi11/app_phone/service/api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // Rx<ProductTotalResponse> productTotal = ProductTotalResponse().obs;
  List<ProductModel> dsProduct = <ProductModel>[].obs;
  RxBool loadAll = false.obs;
  RxBool loadList = false.obs;
  int pageSize = 4;
  int skipSize = 0;
  int? totalSize;
  final ApiService apiService = ApiService();
  Future<void> getDS({
    bool isLoadMore=false
}) async {
    if(dsProduct.isEmpty){
      loadAll.value = true;
    }
    if (isLoadMore) {
      loadList.value = true;
      skipSize += 4;
    }
   // loadAll.value = true;
    final ProductTotalResponse? response = await apiService.fetchRecipes(
      currentSize: pageSize,
      skipSize: skipSize,
    );
    if(pageSize==4){
      loadAll.value=false;
    }
    if (isLoadMore) {
      loadList.value = false;
    }
    if (response == null) {
      Get.snackbar('Error Loaddata!', '');
     // loadAll.value = false;
    } else {
      totalSize = response.totalResults ?? 0;
      dsProduct.addAll(response.results ?? []);
    //  loadAll.value = false;
    }
  }
  Future<void> loadMore() async {
    if (dsProduct.length < (totalSize ?? 0)) {
      await getDS(isLoadMore: true);
    } else {
      // == || >
      //nothing
    }
  }
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getDS();
  }
}
