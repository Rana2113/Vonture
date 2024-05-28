import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'http://localhost:6000';
  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String, dynamic>> post({
    required String endPoint,
    String? jwt,
    required dynamic data,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $jwt',
    };
    var response = await _dio.post('$_baseUrl/$endPoint', data: data);
    return response.data;
  }
}
