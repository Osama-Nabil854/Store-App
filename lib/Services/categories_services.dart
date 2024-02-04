import 'package:dio/dio.dart';
import 'package:store/Helper/api.dart';
import 'package:store/Models/product_model.dart';

class CategoryServices {
  final Dio dio = Dio();

  Future<List<ProductModel>> getAllPeoducts({required String name}) async {
    Response response = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$name');

    List<dynamic> data = response.data;
    List<ProductModel> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
