class DataUserModel {
  Data? data;

  DataUserModel({this.data});

  DataUserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Student? student;

  Data({this.id, this.name, this.student});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  String? age;
  String? bio;
  String? images;

  Student({this.id, this.age, this.bio, this.images});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    bio = json['bio'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['age'] = this.age;
    data['bio'] = this.bio;
    data['images'] = this.images;
    return data;
  }
}