class CommentModel {
  String? content;
  String? postId;

  CommentModel({this.content, this.postId});

  CommentModel.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    postId = json['post_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['post_id'] = this.postId;
    return data;
  }
}
