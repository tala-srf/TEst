
class CoursesModel {
  int? _id;
  String? _name;
  String? _createdAt;
  List<Courses>? _courses;

  CoursesModel(
      {int? id, String? name, String? createdAt, List<Courses>? courses}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (courses != null) {
      this._courses = courses;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  List<Courses>? get courses => _courses;
  set courses(List<Courses>? courses) => _courses = courses;

  CoursesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['createdAt'];
    if (json['courses'] != null) {
      _courses = <Courses>[];
      json['courses'].forEach((v) {
        _courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['createdAt'] = this._createdAt;
    if (this._courses != null) {
      data['courses'] = this._courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? _id;
  String? _name;
  String? _description;
  String? _price;
  String? _finishedAt;
  Teacher? _teacher;
  List<Enrollment>? _enrollment;
  List<Lectures>? _lectures;

  Courses(
      {int? id,
      String? name,
      String? description,
      String? price,
      String? finishedAt,
      Teacher? teacher,
      List<Enrollment>? enrollment,
      List<Lectures>? lectures}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (price != null) {
      this._price = price;
    }
    if (finishedAt != null) {
      this._finishedAt = finishedAt;
    }
    if (teacher != null) {
      this._teacher = teacher;
    }
    if (enrollment != null) {
      this._enrollment = enrollment;
    }
    if (lectures != null) {
      this._lectures = lectures;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get finishedAt => _finishedAt;
  set finishedAt(String? finishedAt) => _finishedAt = finishedAt;
  Teacher? get teacher => _teacher;
  set teacher(Teacher? teacher) => _teacher = teacher;
  List<Enrollment>? get enrollment => _enrollment;
  set enrollment(List<Enrollment>? enrollment) => _enrollment = enrollment;
  List<Lectures>? get lectures => _lectures;
  set lectures(List<Lectures>? lectures) => _lectures = lectures;

  Courses.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _finishedAt = json['finished_At'];
    _teacher =
        json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    if (json['enrollment '] != null) {
      _enrollment = <Enrollment>[];
      json['enrollment '].forEach((v) {
        _enrollment!.add(new Enrollment.fromJson(v));
      });
    }
    if (json['lectures'] != null) {
      _lectures = <Lectures>[];
      json['lectures'].forEach((v) {
        _lectures!.add(new Lectures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    data['price'] = this._price;
    data['finished_At'] = this._finishedAt;
    if (this._teacher != null) {
      data['teacher'] = this._teacher!.toJson();
    }
    if (this._enrollment != null) {
      data['enrollment '] = this._enrollment!.map((v) => v.toJson()).toList();
    }
    if (this._lectures != null) {
      data['lectures'] = this._lectures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Enrollment { int? _id;
  String? _name;

  Enrollment({
    int? id,
    String? name,
  }) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;

  Enrollment.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;

    return data;
  }
}

class Teacher {
  int? _id;
  String? _fname;
  String? _lname;

  Teacher({int? id, String? fname, String? lname}) {
    if (id != null) {
      this._id = id;
    }
    if (fname != null) {
      this._fname = fname;
    }
    if (lname != null) {
      this._lname = lname;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get fname => _fname;
  set fname(String? fname) => _fname = fname;
  String? get lname => _lname;
  set lname(String? lname) => _lname = lname;

  Teacher.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fname = json['Fname'];
    _lname = json['Lname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['Fname'] = this._fname;
    data['Lname'] = this._lname;
    return data;
  }
}

class Lectures {
  int? _id;
  String? _title;
  String? _description;
  int? _index;
  String? _finished;

  Lectures(
      {int? id,
      String? title,
      String? description,
      int? index,
      String? finished}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (index != null) {
      this._index = index;
    }
    if (finished != null) {
      this._finished = finished;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get index => _index;
  set index(int? index) => _index = index;
  String? get finished => _finished;
  set finished(String? finished) => _finished = finished;

  Lectures.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _index = json['index'];
    _finished = json['finished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['index'] = this._index;
    data['finished'] = this._finished;
    return data;
  }
}


