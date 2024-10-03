class PostDataModel{
  final int userId;
  final int id;
  final String title;
  final String body;
  PostDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body
});

  Map<String,dynamic> toMap(){
    return {
      "userId":userId,
      "id": id,
      "title":title,
      "body":body
    };
  }
  factory PostDataModel.fromJson(Map<String,dynamic> map){
     return PostDataModel(
     userId: map["userId"] ?? 0,
     id: map["id"] ?? 0,
     title: map["title"] ?? "",
     body: map["body"] ?? ""
   );
  }

}
