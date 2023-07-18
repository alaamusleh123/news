class Model{
  String status;
  int totalResults;
  List<dynamic> articles;

  Model({required this.status, required this.totalResults, required this.articles});
  factory Model.fromJson(Map<String, dynamic> jsonData){
    return Model(
        status: jsonData['status'],
        totalResults: jsonData['totalResults'],
        articles: jsonData['articles']);
  }
}