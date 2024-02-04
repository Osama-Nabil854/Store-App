import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();
  Future<dynamic> get({required String url}) async {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
  }) async {
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
            // 'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('${e.response?.statusCode}');
    }
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
  }) async {
    Response response = await dio.put(
      url,
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        },
      ),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
