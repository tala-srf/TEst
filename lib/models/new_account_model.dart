class NewAccountModel {
  String? name;
  String? bio;
  String? password;
  String? email;
  String? age;
  String? images;

  NewAccountModel(
      {this.name, this.bio, this.password, this.email, this.age, this.images});

  NewAccountModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bio = json['bio'];
    password = json['password'];
    email = json['email'];
    age = json['age'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['password'] = this.password;
    data['email'] = this.email;
    data['age'] = this.age;
    data['images'] = this.images;
    return data;
  }
}