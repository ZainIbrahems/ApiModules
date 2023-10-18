import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mena/core/network/dio_helper.dart';
import 'package:mena/modules/books_library/models/books_response.dart';
import '../../../core/functions/main_funcs.dart';
import '../models/book_model.dart';
import 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksResponse? res;
  String query = "";

  List<BookModel> list = [];
  int currentOffset = 0;

  BooksCubit() : super(BooksInitial()) {}

  static BooksCubit get(context) => BlocProvider.of(context);

  void setQuery(String s) {
    query = s;
  }

  Future<void> getBooks() async {
    emit(LoadingDataState());
    await MainDioHelper.getData(
        url: 'https://openlibrary.org/search.json',
        query: {
          "q": query,
          "fields": "*,availability",
          "limit": 10,
          "offset": currentOffset,
        }).then(
      (value) {
        res = BooksResponse.fromJson(value.data);
        list.addAll(res!.books!);
        currentOffset += 10;
        emit(DataLoadedSuccessState());
      },
    ).catchError((error, stack) {
      logg('an error occurred');
      logg(error.toString());
      logg(stack.toString());
      emit(ErrorLoadingDataState());
    });
  }
}
