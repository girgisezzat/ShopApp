import 'package:dio/dio.dart';

class DioHelper
{

  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/', //header url = base url
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url, //method url
    Map<String, dynamic>? query, //query url
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Authorization': token != null? token: '',
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Authorization': token != null? token : '',
      'Content-Type': 'application/json',
    };

    //token ?? ''
    //x=y ?? z  if y = null => x=z

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Authorization': token != null? token: '',
      'Content-Type': 'application/json',
    };

    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

}