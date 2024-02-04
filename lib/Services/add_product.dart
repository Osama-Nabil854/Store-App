import 'package:dio/dio.dart';
import 'package:store/Helper/api.dart';
import 'package:store/Models/product_model.dart';

class AddProdcut {
  Future<ProductModel> addProdcut({
    required String title,
    required num price,
    required String description,
    required String image,
    required String category,
  }) async {
    Response response = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    Map<String, dynamic> data = response.data;
    return ProductModel.fromJson(data);
  }
}
