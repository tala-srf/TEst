import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:ajyal/models/courses_model.dart';
import 'package:ajyal/service/courses_service.dart';


part 'coursesbloc_event.dart';
part 'coursesbloc_state.dart';

class CoursesblocBloc extends Bloc<CoursesblocEvent, CoursesblocState> {
  CoursesblocBloc() : super(CoursesblocInitial()) {
    on<LoadCoursesEvent>((event, emit) async {
      emit(LoadingCourses());
      try {
        List<CoursesModel> category =
            await coursesService.gatallcategorecourses();
  
        emit(FetchCourses( category: category));
      } catch (e) {
        ErrorFetchCorses();
      }
    });
  }
  CoursesService coursesService = CoursesService();
}
