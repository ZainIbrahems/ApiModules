import 'book_model.dart';

class BooksResponse {
  List<BookModel>? books;
  int? numFound;
  int? offset;

  BooksResponse({this.offset, this.numFound, this.books});

  factory BooksResponse.fromJson(Map<String, dynamic> json) {
    return BooksResponse(
      books: List.from(json["docs"].map((e) => BookModel.fromJson(e))),
      numFound: json["numFound"],
      offset: json["offset"],
    );
  }
}
