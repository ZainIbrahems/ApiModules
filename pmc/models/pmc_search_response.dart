class PMCSearchResponse {
  Header? header;
  Esearchresult? esearchresult;

  PMCSearchResponse({this.header, this.esearchresult});

  PMCSearchResponse.fromJson(Map<String, dynamic> json) {
    header =
    json['header'] != null ? Header.fromJson(json['header']) : null;
    esearchresult = json['esearchresult'] != null
        ? Esearchresult.fromJson(json['esearchresult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (esearchresult != null) {
      data['esearchresult'] = esearchresult!.toJson();
    }
    return data;
  }
}

class Header {
  String? type;
  String? version;

  Header({this.type, this.version});

  Header.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['version'] = version;
    return data;
  }
}

class Esearchresult {
  String? count;
  String? retmax;
  String? retstart;
  List<String>? idlist;
  String? querytranslation;

  Esearchresult(
      {this.count,
        this.retmax,
        this.retstart,
        this.idlist,
        this.querytranslation});

  Esearchresult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    retmax = json['retmax'];
    retstart = json['retstart'];
    idlist = json['idlist'].cast<String>();
    querytranslation = json['querytranslation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['retmax'] = retmax;
    data['retstart'] = retstart;
    data['idlist'] = idlist;
    data['querytranslation'] = querytranslation;
    return data;
  }
}
