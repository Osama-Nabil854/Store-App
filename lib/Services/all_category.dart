import 'package:dio/dio.dart';
import 'package:store/Helper/api.dart';

class AllCategoryService {
  final Dio dio = Dio();
  Future<List> getAllCategory() async {
    Response response =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    List<dynamic> data = response.data;
    return data;
  }
}
