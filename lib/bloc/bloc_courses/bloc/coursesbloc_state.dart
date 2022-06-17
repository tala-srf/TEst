part of 'coursesbloc_bloc.dart';

@immutable
abstract class CoursesblocState {}

class CoursesblocInitial extends CoursesblocState {}

class LoadingCourses extends CoursesblocState {}

class FetchCourses extends CoursesblocState {
  CoursesModel category;

  FetchCourses({required this.category});
}

class ErrorFetchCorses extends CoursesblocState {}
