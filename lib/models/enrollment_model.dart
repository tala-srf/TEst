class EnrollmentModel {
  String? courseId;

  EnrollmentModel({this.courseId});

  EnrollmentModel.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    return data;
  }
}