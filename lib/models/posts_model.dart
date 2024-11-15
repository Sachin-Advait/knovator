class PostsModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  bool isRead;
  Duration elapsedTime;

  PostsModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.isRead = false,
    this.elapsedTime = Duration.zero,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],

        /// while fetching from local db we get isRead 0 or 1.
        isRead: json['isRead'] == 1,
      );

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
      'isRead': isRead ? 1 : 0,
    };
  }

  PostsModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    bool? isRead,
    Duration? elapsedTime,
  }) {
    return PostsModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
      elapsedTime: elapsedTime ?? this.elapsedTime,
    );
  }
}
