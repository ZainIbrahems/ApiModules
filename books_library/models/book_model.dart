class BookModel {
  String? key;
  String? title;
  String? firstYearPublish;
  AvailabilityModel? availability;
  int? coverId;

  BookModel({
    this.key,
    this.availability,
    this.firstYearPublish,
    this.title,
    this.coverId,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        key: json["key"],
        availability: json['availability'] != null
            ? AvailabilityModel.fromJson(
                json['availability'],
              )
            : null,
        title: json["title"],
        coverId: json["cover_i"],
        firstYearPublish: json["first_year_publish"]);
  }
}

class AvailabilityModel {
  String? isbn;

  AvailabilityModel({this.isbn});

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(isbn: json["isbn"]);
  }
}
