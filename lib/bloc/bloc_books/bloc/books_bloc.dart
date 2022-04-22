import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ajyal/models/books_model.dart';
import 'package:ajyal/service/books_service.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksInitial()) {
    on<LoadBooksEvent>((event, emit) async {
      emit(LoadingBooks());
      try {
        List<BooksModel> categoryBook =
            await booksService.gatallcategorybook();
  
        emit(FetchBooks( categoryBook: categoryBook));
      } catch (e) {
        ErrorFetchCorses();
      }
    });
  }
  BooksService booksService = BooksService();
}
