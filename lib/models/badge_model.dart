class BadgeModel {
  List<CoursesCount>? coursesCount;
  List<BooksCount>? booksCount;

  BadgeModel({this.coursesCount, this.booksCount});

  BadgeModel.fromJson(Map<String, dynamic> json) {
    if (json['courses_count'] != null) {
      coursesCount = <CoursesCount>[];
      json['courses_count'].forEach((v) {
        coursesCount!.add(new CoursesCount.fromJson(v));
      });
    }
    if (json['books_count'] != null) {
      booksCount = <BooksCount>[];
      json['books_count'].forEach((v) {
        booksCount!.add(new BooksCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coursesCount != null) {
      data['courses_count'] =
          this.coursesCount!.map((v) => v.toJson()).toList();
    }
    if (this.booksCount != null) {
      data['books_count'] = this.booksCount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CoursesCount {
  int? id;
  String? name;
  int? studentId;
  int? courseId;
  Null? bookId;
  String? createdAt;
  String? updatedAt;

  CoursesCount(
      {this.id,
      this.name,
      this.studentId,
      this.courseId,
      this.bookId,
      this.createdAt,
      this.updatedAt});

  CoursesCount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    studentId = json['student_id'];
    courseId = json['course_id'];
    bookId = json['book_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['student_id'] = this.studentId;
    data['course_id'] = this.courseId;
    data['book_id'] = this.bookId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class BooksCount {
  int? id;
  String? name;
  int? studentId;
  Null? courseId;
  int? bookId;
  String? createdAt;
  String? updatedAt;

  BooksCount(
      {this.id,
      this.name,
      this.studentId,
      this.courseId,
      this.bookId,
      this.createdAt,
      this.updatedAt});

  BooksCount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    studentId = json['student_id'];
    courseId = json['course_id'];
    bookId = json['book_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['student_id'] = this.studentId;
    data['course_id'] = this.courseId;
    data['book_id'] = this.bookId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}