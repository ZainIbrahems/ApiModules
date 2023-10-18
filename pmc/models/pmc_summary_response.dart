class PMCSummaryResponse {
  List<Map<String, Article>>? summary;

  PMCSummaryResponse({this.summary});

  factory PMCSummaryResponse.fromJson(Map<String, dynamic> json) {
    List<Map<String, Article>> temp = [];

    if (!json.containsKey("result")) {
      return PMCSummaryResponse();
    }
    json["result"].forEach((key, value) {
      if (key != "uids") {
        temp.add({key: Article.fromJson(value)});
      }
    });
    return PMCSummaryResponse(summary: temp);
  }
}

class Article {
  String? uid;
  String? pubdate;
  String? epubdate;
  String? printpubdate;
  String? source;
  List<Authors>? authors;
  String? title;
  String? volume;
  String? issue;
  String? pages;
  List<Articleids>? articleids;
  String? fulljournalname;
  String? sortdate;
  String? pmclivedate;

  Article(
      {this.uid,
      this.pubdate,
      this.epubdate,
      this.printpubdate,
      this.source,
      this.authors,
      this.title,
      this.volume,
      this.issue,
      this.pages,
      this.articleids,
      this.fulljournalname,
      this.sortdate,
      this.pmclivedate});

  Article.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    pubdate = json['pubdate'];
    epubdate = json['epubdate'];
    printpubdate = json['printpubdate'];
    source = json['source'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add(Authors.fromJson(v));
      });
    }
    title = json['title'];
    volume = json['volume'];
    issue = json['issue'];
    pages = json['pages'];
    if (json['articleids'] != null) {
      articleids = <Articleids>[];
      json['articleids'].forEach((v) {
        articleids!.add(Articleids.fromJson(v));
      });
    }
    fulljournalname = json['fulljournalname'];
    sortdate = json['sortdate'];
    pmclivedate = json['pmclivedate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['pubdate'] = pubdate;
    data['epubdate'] = epubdate;
    data['printpubdate'] = printpubdate;
    data['source'] = source;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['volume'] = volume;
    data['issue'] = issue;
    data['pages'] = pages;
    if (articleids != null) {
      data['articleids'] = articleids!.map((v) => v.toJson()).toList();
    }
    data['fulljournalname'] = fulljournalname;
    data['sortdate'] = sortdate;
    data['pmclivedate'] = pmclivedate;
    return data;
  }
}

class Authors {
  String? name;
  String? authtype;

  Authors({this.name, this.authtype});

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    authtype = json['authtype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['authtype'] = authtype;
    return data;
  }
}

class Articleids {
  String? idtype;
  String? value;

  Articleids({this.idtype, this.value});

  Articleids.fromJson(Map<String, dynamic> json) {
    idtype = json['idtype'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idtype'] = idtype;
    data['value'] = value;
    return data;
  }
}
