import 'package:ajyal/models/books_model.dart';

import 'package:http/http.dart' as http;

import 'package:ajyal/service/config.dart';
import 'dart:convert';

class BooksService {
  Future<List<BooksModel>> gatallcategorybook() async {
    return [
      BooksModel(id: 13, name: "قصص", books: [
        Books(
            id: 12,
            name: "أربعون",
            title:
                " كتاب تم تأليفه بواسطة أحمد الشقيري في اثناء خلوته لـمدة أربعون يوماً في جزيرة نائية بعيداً عن الناس، شواغل التكنولوجيا وملهيات الحياة. يتحدث أحمد عن خواطر وتجارب حدثت له في حياته",
            auther: "أحمد الشقيري"),
        Books(
            id: 12,
            name: "لأنك الله",
            title: "أجمل الأوقات مع أسماء الله الحسنى",
            auther: "علي"),
        Books(
            id: 12,
            name: "ألواح ودسر",
            title:
                "رواية استثنائية عن عالم استثنائي ومختلف. قد يكون عالمنا الحقيقي بعد أن نزيل عنه أقنعته ونزيح عنه أصباغه. عالم تسقط فيه الجدران الوهمية بين الزمان والمكان، فإذا بالماضي يصير بصيغة الحاضر، والحاضر يتلبّس صيغة المستقبل.",
            auther: "أحمد خير العمري"),
        Books(
            id: 12,
            name: "سيدنا إبراهيم",
            title: "قصة ممتعة تتحدث عن دعوة سيدنا إبراهيم",
            auther: "يمنى اللحام"),
        Books(
            id: 12,
            name: "بائعة الكبريت",
            title: "قصة واقعة عن الحياة في باريس",
            auther: "ياسر الحلبي"),
        Books(
            id: 12,
            name: "البؤساء",
            title:
                " تعد من أشهر روايات القرن التاسع عشر، إنه يصف وينتقد في هذا الكتاب الظلم الاجتماعي في فرنسا بين سقوط نابليون في 1815 والثورة الفاشلة ضد الملك لويس فيليب في 1832. ",
            auther: " فكتور هوغو")
      ]),
      BooksModel(
          id: 13,
          name: "تعليم",
          books: [Books(id: 12, name: "", title: "", auther: "")]),
      BooksModel(
          id: 13,
          name: "علوم",
          books: [Books(id: 12, name: "", title: "", auther: "")]),
      BooksModel(
          id: 13,
          name: "ذكاء",
          books: [Books(id: 12, name: "", title: "", auther: "")]),
    ];
  }
}
