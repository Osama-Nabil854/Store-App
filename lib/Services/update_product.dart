import 'package:dio/dio.dart';

import '../Helper/api.dart';
import '../Models/product_model.dart';

class UpdateProductServices {
  final Dio dio = Dio();
  Future<ProductModel> addProdcut({
    required String title,
    required num price,
    required String description,
    required String image,
    required String category,
    required String id,
  }) async {
    Response response = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
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
