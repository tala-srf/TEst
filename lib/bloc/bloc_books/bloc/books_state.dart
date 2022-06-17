part of 'books_bloc.dart';

@immutable
abstract class BooksState {}

class BooksInitial extends BooksState {}


class LoadingBooks extends BooksState {}

class FetchBooks extends BooksState {
  BooksModel categoryBook;

  FetchBooks({required this.categoryBook});
}

class ErrorFetchCorses extends BooksState {}