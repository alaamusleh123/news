import 'package:dio/dio.dart';

class DioNews{
  late Dio dio;
  DioNews(){
    dio= Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2/',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      )
    );
  }
  Future<Response> getNews({required String path, required Map<String,dynamic> queryParameters})async{
    Response response= await dio.get(path,queryParameters: queryParameters);
    return response;
  }
}