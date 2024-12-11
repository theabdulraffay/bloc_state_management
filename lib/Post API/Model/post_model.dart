class PostModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostModel({this.postId, this.id, this.name, this.email, this.body});

  PostModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) =>
      PostModel(
        postId: postId ?? this.postId,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        body: body ?? this.body,
      );

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}
