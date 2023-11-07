import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"},
        ));

    return response;
  }

  Future<Response> get(
      {required String url,
      String? token,
      Map<String, String>? headers}) async {
    var response = await dio.get(
      url,
      options: Options(headers: headers ?? {'Authorization': "Bearer $token"}),
    );

    return response;
  }

  Future<Response> put(
      {required body,
      required String url,
      String? token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio.put(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ?? {'Authorization': "Bearer $token"},
      ),
    );

    return response;
  }

  Future<Response> delete(
      {required String url,
      String? token,
      Map<String, String>? headers}) async {
    var response = await dio.delete(
      url,
      options: Options(headers: headers ?? {'Authorization': "Bearer $token"}),
    );

    return response;
  }
}
