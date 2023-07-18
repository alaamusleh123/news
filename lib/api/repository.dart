import 'package:dio/dio.dart';
import 'package:news_api/api/dio.dart';
import 'package:news_api/api/model.dart';

class Repository{
  DioNews dioNews=DioNews();
  Future<Model> getNews()async{
    Response response =await dioNews.getNews(
        path: 'top-headlines',
        queryParameters: {
          'country' : 'science',
          'country' : 'us',
          'apiKey' : '8bb09ec10e58425584b5ad65549dfedc',
          //'pageSize' : 70
        });
    return Model.fromJson(response.data);
  }
}