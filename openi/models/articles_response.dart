class ArticlesResponse {
  int? min;
  int? max;
  int? count;
  int? total;
  String? approxImage;
  List<ArticleModel>? list;
  String? queryError;

  ArticlesResponse(
      {this.queryError,
        this.min,
        this.max,
        this.count,
        this.total,
        this.approxImage,
        this.list});

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('Query-Error')) {
      return ArticlesResponse(
          queryError: json['Query-Error'], total: json['total']);
    }
    return ArticlesResponse(
        min: json['min'],
        max: json['max'],
        count: json['count'],
        total: json['total'],
        approxImage: json['approximage'],
        list: json['list']
            .map<ArticleModel>((e) => ArticleModel.fromJson(e))
            ?.toList());
  }
}

class ArticleModel {
  String? uid;
  String? pmcid;
  String? pmid;
  String? docSource;
  String? articleType;
  String? pmcUrl;
  String? pubMedUrl;
  String? title;
  String? fulltextHtmlUrl;
  String? journalTitle;
  String? journalAbbr;
  JournalDate? journalDate;
  String? authors;
  String? affiliate;
  List<Outcome>? outcome;
  MeSH? meSH;
  String? problems;
  Image? image;
  String? imgThumb;
  String? imgLarge;
  String? imgThumbLarge;
  String? imgGrid150;
  String? similarInCollection;
  String? getArticleFigures;
  String? detailedQueryURL;
  String? similarInResults;

  ArticleModel(
      {this.uid,
        this.pmcid,
        this.pmid,
        this.docSource,
        this.articleType,
        this.pmcUrl,
        this.pubMedUrl,
        this.title,
        this.fulltextHtmlUrl,
        this.journalTitle,
        this.journalAbbr,
        this.journalDate,
        this.authors,
        this.affiliate,
        this.outcome,
        this.meSH,
        this.problems,
        this.image,
        this.imgThumb,
        this.imgLarge,
        this.imgThumbLarge,
        this.imgGrid150,
        this.similarInCollection,
        this.getArticleFigures,
        this.detailedQueryURL,
        this.similarInResults});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        uid: json['uid'],
        pmcid: json['pmcid'],
        pmid: json['pmid'],
        docSource: json['docSource'],
        articleType: json['articleType'],
        pmcUrl: json['pmc_url'],
        pubMedUrl: json['pubMed_url'],
        title: json['title'].toString(),
        fulltextHtmlUrl: json['fulltext_html_url'],
        journalTitle: json['journal_title'],
        journalAbbr: json['journal_abbr'],
        journalDate: json['journal_date'] != null
            ? JournalDate.fromJson(json['journal_date'])
            : null,
        authors: json['authors'],
        affiliate: json['affiliate'],
        outcome: json['Outcome'] != null
            ? json['Outcome'].map<Outcome>((e) => Outcome.fromJson(e))?.toList()
            : null,
        meSH: json['MeSH'] != null ? MeSH.fromJson(json['MeSH']) : null,
        problems: json['Problems'],
        image: json['MeSH'] != null ? Image.fromJson(json['image']) : null,
        imgThumb: json['imgThumb'],
        imgLarge: json['imgLarge'],
        imgThumbLarge: json['imgThumbLarge'],
        imgGrid150: json['imgGrid150'],
        similarInCollection: json['similarInCollection'],
        getArticleFigures: json['getArticleFigures'],
        detailedQueryURL: json['detailedQueryURL'],
        similarInResults: json['similarInResults']);
  }
}

class JournalDate {
  String? day;
  String? month;
  String? year;

  JournalDate({required this.day, required this.month, required this.year});

  factory JournalDate.fromJson(Map<String, dynamic> json) {
    return JournalDate(
        day: json['day'], month: json['month'], year: json['year']);
  }
}

class Outcome {
  String? score;
  String? text;

  Outcome({this.score, this.text});

  Outcome.fromJson(Map<String, dynamic> json) {
    score = json['@score'];
    text = json['#text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@score'] = score;
    data['#text'] = text;
    return data;
  }
}

class MeSH {
  List<String>? minor;
  List<String>? major;

  MeSH({this.minor, this.major});

  MeSH.fromJson(Map<String, dynamic> json) {
    minor = json['minor'].cast<String>();
    major = json['major'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minor'] = minor;
    data['major'] = major;
    return data;
  }
}

class Image {
  String? id;
  String? caption;

  Image({this.id, this.caption});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['caption'] = caption;
    return data;
  }
}
