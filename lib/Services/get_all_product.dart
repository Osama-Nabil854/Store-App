import 'package:dio/dio.dart';
import 'package:store/Helper/api.dart';
import 'package:store/Models/product_model.dart';

class AllProductServices {
  final Dio dio = Dio();

  Future<List<ProductModel>> getAllPeoducts() async {
    Response response =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<dynamic> data = response.data;
    List<ProductModel> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
