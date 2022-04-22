import 'package:ajyal/models/courses_model.dart';
import 'package:http/http.dart' as http;

import 'package:ajyal/service/config.dart';
import 'dart:convert';

class CoursesService {
  Future<List<CoursesModel>> gatallcategorecourses() async {
    return [
      CoursesModel(id: 12, name: "تقنيات", createdAt: "2022/2/2", courses: [
        Courses(id: 12,
                 description: "يطلق على هذه الدورة اسم دورة تعليم سكراتش للاطفال ، أو تعليم البرمجة للمبتدئين ، أو دورة تعليم scratch ، وفى دروس تعليم سكراتش هذه سوف تتعرف على مبادئ البرمجة التى تجعلك فى اقرب موقت محترفا فيها لنجيب على السؤال الذى يدور بأذهان الكثيرين ( كيف تصبح مبرمج محترف ) ",
            name: "1البرمجة لليافعين",
            price: "يبلا",
            enrollment: [Enrollment(name: "user", id: 2)],
            finishedAt: "",
            lectures: [
              Lectures(id: 12,

                  description: "يطلق على هذه الدورة اسم دورة تعليم سكراتش للاطفال ، أو تعليم البرمجة للمبتدئين ، أو دورة تعليم scratch ، وفى دروس تعليم سكراتش هذه سوف تتعرف على مبادئ البرمجة التى تجعلك فى اقرب موقت محترفا فيها لنجيب على السؤال الذى يدور بأذهان الكثيرين ( كيف تصبح مبرمج محترف ) ",
                  finished: "yes",
                  title: "الفصل الاولى",
                  index: 322),
                    Lectures(

                  description: "يطلق على هذه الدورة اسم دورة تعليم سكراتش للاطفال ، أو تعليم البرمجة للمبتدئين ، أو دورة تعليم scratch ، وفى دروس تعليم سكراتش هذه سوف تتعرف على مبادئ البرمجة التى تجعلك فى اقرب موقت محترفا فيها لنجيب على السؤال الذى يدور بأذهان الكثيرين ( كيف تصبح مبرمج محترف ) ",
                  finished: "yes",
                  title: "الفصل الثانية",
                  index: 322),
                    Lectures(

                  description: "يطلق على هذه الدورة اسم دورة تعليم سكراتش للاطفال ، أو تعليم البرمجة للمبتدئين ، أو دورة تعليم scratch ، وفى دروس تعليم سكراتش هذه سوف تتعرف على مبادئ البرمجة التى تجعلك فى اقرب موقت محترفا فيها لنجيب على السؤال الذى يدور بأذهان الكثيرين ( كيف تصبح مبرمج محترف ) ",
                  finished: "يبلا",
                  title: "الفصل الثالث",
                  index: 322),
                    Lectures(

                  description: "يطلق على هذه الدورة اسم دورة تعليم سكراتش للاطفال ، أو تعليم البرمجة للمبتدئين ، أو دورة تعليم scratch ، وفى دروس تعليم سكراتش هذه سوف تتعرف على مبادئ البرمجة التى تجعلك فى اقرب موقت محترفا فيها لنجيب على السؤال الذى يدور بأذهان الكثيرين ( كيف تصبح مبرمج محترف ) ",
                  finished: "يبلا",
                  title: "الفصل الرابعة",
                  index: 322),
                    Lectures(

                  description: "يبلا",
                  finished: "يبلا",
                  title: "الفصل الخامسة",
                  index: 322),
            ],
            teacher: Teacher(fname: "الآنسة ندى اللحام")),
       
      ]),
      CoursesModel(name: "أنشطة", createdAt: "2022/2/2", courses: [
        Courses(
            description: "سنتمكن من هذا الكورس من التعرف على مبادئ",
            name: "2سكراتش",
            price: "يبلا",
            enrollment: [Enrollment(name: "user", id: 2)],
            finishedAt: "",
            lectures: [
              Lectures(
                  description: "يطلق على هذه الدورة اسم دورة تعليم سكراتش للاطفال ، أو تعليم البرمجة للمبتدئين ، أو دورة تعليم scratch ، وفى دروس تعليم سكراتش هذه سوف تتعرف على مبادئ البرمجة التى تجعلك فى اقرب موقت محترفا فيها لنجيب على السؤال الذى يدور بأذهان الكثيرين ( كيف تصبح مبرمج محترف ) ",
                  finished: "يبلا",
                  title: "يبلات",
                  index: 322)
            ],
            teacher: Teacher(fname: "الآنسة آية الحمصي")),
        Courses(
            description: "سنتمكن من هذا الكورس من التعرف على مبادئ",
            name: "2سكراتش",
            price: "يبلا",
            enrollment: [Enrollment(name: "user", id: 2)],
            finishedAt: "",
            lectures: [
              Lectures(
                  description: "يبلا",
                  finished: "يبلا",
                  title: "يبلات",
                  index: 322)
            ],
            teacher: Teacher(fname: "الآنسة آية الحمصي")),
        Courses(
            description: "سنتمكن من هذا الكورس من التعرف على مبادئ",
            name: "سكراتش2",
            price: "يبلا",
            enrollment: [Enrollment(name: "user", id: 2)],
            finishedAt: "",
            lectures: [
              Lectures(
                  description: "يبلا",
                  finished: "يبلا",
                  title: "يبلات",
                  index: 322)
            ],
            teacher: Teacher(fname: "الآنسة آية الحمصي")),
      ]),
      CoursesModel(name: " متعة", createdAt: "2022/2/2", courses: [
        Courses(
            description: "سنتمكن من هذا الكورس من التعرف على مبادئ",
            name: "البرمجة لليافعين3",
            price: "يبلا",
            enrollment: [Enrollment(name: "user", id: 2)],
            finishedAt: "",
            lectures: [
              Lectures(
                  description: "يبلا",
                  finished: "يبلا",
                  title: "يبلات",
                  index: 322)
            ],
            teacher: Teacher(fname: "الأستاذ ياسر اللحام")),
        Courses(
            description: "سنتمكن من هذا الكورس من التعرف على مبادئ",
            name: "3البرمجة لليافعين",
            price: "يبلا",
            enrollment: [Enrollment(name: "us", id: 2)],
            finishedAt: "",
            lectures: [
              Lectures(
                  description: "يبلا",
                  finished: "يبلا",
                  title: "يبلات",
                  index: 322)
            ],
            teacher: Teacher(fname: "الأستاذ ياسر اللحام")),
        Courses(
            description: "سنتمكن من هذا الكورس من التعرف على مبادئ",
            name: "3سكراتش",
            price: "يبلا",
            enrollment: [Enrollment(name: "us", id: 2)],
            finishedAt: "",
            lectures: [
              Lectures(
                  description: "يبلا",
                  finished: "يبلا",
                  title: "يبلات",
                  index: 322)
            ],
            teacher: Teacher(fname: "الآنسة آية الحمصي")),
      ]),
    ];
  }
}
