import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ajyal/models/books_model.dart';
import 'package:ajyal/service/books_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksInitial()) {
    on<LoadBooksEvent>((event, emit) async {
      emit(LoadingBooks());
      try {
        BooksModel categoryBook =
            await booksService.gatallcategorybook((await SharedPreferences.getInstance()).getString('backend_token') ??
              'EMPTY_TOKEN',);
  
        emit(FetchBooks( categoryBook: categoryBook));
      } catch (e) {
        ErrorFetchCorses();
      }
    });
  }
  BooksService booksService = BooksService();
}
