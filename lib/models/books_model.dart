class BooksModel {
  int? id;
  String? name;
  List<Books>? books;

  BooksModel({this.id, this.name, this.books});

  BooksModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  String? title;
  String? name;
  String? auther;

  Books({this.id, this.title, this.name, this.auther});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    name = json['name'];
    auther = json['auther'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['name'] = this.name;
    data['auther'] = this.auther;
    return data;
  }
}