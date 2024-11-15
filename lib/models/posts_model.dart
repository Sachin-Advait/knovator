class PostsModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  bool isRead;

  PostsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.isRead = false,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
        isRead: false,
      );
}
