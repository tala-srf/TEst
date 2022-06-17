class AuthModel {
  String? email;
  String? password;
  String? token;

  AuthModel({required this.email,required this.password,this.token});

  AuthModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
     token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
     data['token'] = this.token;
    return data;
  }
}
