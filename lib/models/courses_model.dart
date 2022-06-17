
class CoursesModel {
  List<Data>? data;

  CoursesModel({this.data});

  CoursesModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  List<Courses>? courses;

  Data({this.id, this.name, this.courses});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  String? name;
  String? description;
  String? teacherId;
  List<Enrollments>? enrollments;
  List<Lectures>? lectures;

  Courses(
      {this.id,
      this.name,
      this.description,
      this.teacherId,
      this.enrollments,
      this.lectures});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    teacherId = json['teacher_id'];
    if (json['enrollments'] != null) {
      enrollments = <Enrollments>[];
      json['enrollments'].forEach((v) {
        enrollments!.add(new Enrollments.fromJson(v));
      });
    }
    if (json['lectures'] != null) {
      lectures = <Lectures>[];
      json['lectures'].forEach((v) {
        lectures!.add(new Lectures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['teacher_id'] = this.teacherId;
    if (this.enrollments != null) {
      data['enrollments'] = this.enrollments!.map((v) => v.toJson()).toList();
    }
    if (this.lectures != null) {
      data['lectures'] = this.lectures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Enrollments {
  int? id;
  int? courseId;
  int? studentId;

  Enrollments({this.id, this.courseId, this.studentId});

  Enrollments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    studentId = json['student_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['student_id'] = this.studentId;
    return data;
  }
}

class Lectures {
  int? id;
  String? title;
  int? sort;
  String? description;
  String? video;
  List<FinishedLecture>? finishedLecture;

  Lectures(
      {this.id,
      this.title,
      this.sort,
      this.description,
      this.video,
      this.finishedLecture});

  Lectures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sort = json['sort'];
    description = json['description'];
    video = json['video'];
    if (json['finished_lecture'] != null) {
      finishedLecture = <FinishedLecture>[];
      json['finished_lecture'].forEach((v) {
        finishedLecture!.add(new FinishedLecture.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sort'] = this.sort;
    data['description'] = this.description;
    data['video'] = this.video;
    if (this.finishedLecture != null) {
      data['finished_lecture'] =
          this.finishedLecture!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FinishedLecture {
  int? studentId;

  FinishedLecture({this.studentId});

  FinishedLecture.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    return data;
  }
}