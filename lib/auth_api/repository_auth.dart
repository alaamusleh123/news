import 'package:dio/dio.dart';

import 'dio_auth.dart';
import 'model-auth.dart';

class RepositoryAuth{
  DioAuth dioAuth= DioAuth();
  Future<ModelAuth> login({required String email, required String password})async{
    Response response = await dioAuth.postData(
        path: 'login',
        data: {
          "email" : email,
          "password": password,
        }
    );
    return ModelAuth.fromJson(response.data);
  }
}