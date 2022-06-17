class FinishedLectureModel {
  String? lectureId;

  FinishedLectureModel({this.lectureId});

  FinishedLectureModel.fromJson(Map<String, dynamic> json) {
    lectureId = json['lecture_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lecture_id'] = this.lectureId;
    return data;
  }
}