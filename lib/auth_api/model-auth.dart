class ModelAuth{
  bool status;
  String message;
  Map<String,dynamic> data;

  ModelAuth({required this.status, required this.message, required this.data});
  factory ModelAuth.fromJson(Map<String, dynamic> jsonData){
   return ModelAuth(
       status : jsonData['status'],
       message : jsonData['message'],
       data : jsonData['data'],
   );
  }
}