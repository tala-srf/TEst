class PostModel {
  List<Data>? data;

  PostModel({this.data});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? createdAt;
  int? id;
  String? title;
  String? content;
  String? teacherId;
  String? images;
  List<Comments>? comments;
  List<Likes>? likes;

  Data(
      {this.createdAt,
      this.id,
      this.title,
      this.content,
      this.teacherId,
      this.images,
      this.comments,
      this.likes});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    title = json['title'];
    content = json['content'];
    teacherId = json['teacher_id'];
    images = json['images'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(new Likes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['teacher_id'] = this.teacherId;
    data['images'] = this.images;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.likes != null) {
      data['likes'] = this.likes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int? id;
  String? content;
  int? postId;
  String? studentId;

  Comments({this.id, this.content, this.postId, this.studentId});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    postId = json['post_id'];
    studentId = json['student_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['post_id'] = this.postId;
    data['student_id'] = this.studentId;
    return data;
  }
}

class Likes {
  int? id;
  int? postId;
  int? studentId;

  Likes({this.id, this.postId, this.studentId});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    studentId = json['student_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['student_id'] = this.studentId;
    return data;
  }
}