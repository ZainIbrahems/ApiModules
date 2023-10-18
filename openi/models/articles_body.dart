class SearchArticlesBody {
  String queryString;

  // String min;
  String max;
  String articles;
  String imageType;
  String specialists;
  String collections;

  SearchArticlesBody({
    required this.queryString,
    required this.max,
    // required this.min,
    required this.articles,
    required this.collections,
    required this.imageType,
    required this.specialists,
  });

  Map<String, dynamic> validate() {
    Map<String, dynamic> errors = {};
    if (queryString.isEmpty) {
      errors['query'] = "this field is required";
    }
    return errors;
  }

  Map<String, String> toMap() {
    return {
      if (queryString.isNotEmpty) 'query': queryString,
      // if (min.isNotEmpty) 'm': min,
      if (max.isNotEmpty) 'n': max,
      if (articles.isNotEmpty) 'at': articles,
      if (collections.isNotEmpty) 'coll': collections,
      if (imageType.isNotEmpty) 'it': imageType,
      if (specialists.isNotEmpty) 'sp': specialists,
    };
  }
}
