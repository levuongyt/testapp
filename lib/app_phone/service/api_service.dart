import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/products_response.dart';

class ApiService {
  final Dio _dio = Dio();
  ApiService() {
    _dio.options.baseUrl = 'https://api.spoonacular.com';
    _dio.options.queryParameters = {
      'apiKey': '519ebeb1f0994c09b3e51a40d7b0a288'
    };
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<ProductTotalResponse?> fetchRecipes({
    required int currentSize,
    required int skipSize,
  }) async {
    try {
      final response =
          await _dio.get('/recipes/complexSearch', queryParameters: {
        'number': currentSize,
        'offSet': skipSize,
      });
      if (response.statusCode == 200) {
        try {
          return ProductTotalResponse.fromJson(
              response.data as Map<String, dynamic>);
        } catch (_) {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
  }
  // List<String> thongTinSP=[];
  // void getThongTin(){
  //   thongTinSP=d
  // }
}
