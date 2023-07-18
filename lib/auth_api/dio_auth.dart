import 'package:dio/dio.dart';

class DioAuth{
  late Dio dio;
  DioAuth(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
      ),
    );
  }

  Future<Response> postData({required String path, required Map<String,dynamic> data}) async{
    Response response= await dio.post(path, data: data);
    return response;
  }
}